# OpenSIPS SoftSwitch 自定义分支

本项目基于官方 [OpenSIPS/opensips-softswitch-ce](https://github.com/OpenSIPS/opensips-softswitch-ce) 分支，进行了以下定制化修改，以满足更好的兼容性与实际业务需求，尤其是支持 WebRTC（JsSIP）通讯。

---

## ✨ 自定义内容说明

### ✅ 1. 修复数据库脚本版本不匹配问题

* 官方使用的是 RPM 安装方式加载数据库脚本，脚本版本与实际 OpenSIPS 程序版本不匹配，导致初始化失败。
* 自定义版本中：

  * 移除 RPM 安装方式；
  * 使用 OpenSIPS 3.5 版本的 MySQL 初始化脚本；
  * 挂载脚本并直接初始化数据库；
  * 映射数据库端口，便于调试与访问。

### ✅ 2. 替换 RTPProxy 为 RTPengine

* 为了兼容 WebRTC（如 JsSIP），将原本使用的 RTPProxy 替换为 RTPengine；
* 调整相关数据库表结构、配置与 OpenSIPS 脚本逻辑；
* 配置了 `rtpengine_offer` 和 `rtpengine_answer` 的参数，以支持 SDP 协议转换及 ICE、RTCP-MUX 等选项。

---

## 🧱 Docker Compose 结构变更

### MySQL 容器

* **变更**：
  * 移除原有的 RPM 安装脚本；
  * 使用挂载方式加载 `3.5` 脚本；
  * 映射端口供外部访问；

### OpenSIPS 容器

* **变更**：
  * 自行 build 镜像；
  * 增加 WebSocket (`8080`) 端口映射；
  * 使用 `proto_ws.so` 模块启用 WebSocket；

### OpenSIPS-CP 容器

* **变更**：

  * 默认 `80` 端口可能已被使用，做了端口调整；

### RTPengine 替换 RTPProxy

* 替换原来的 `rtpproxy` 容器；
* 使用新的 `rtpengine` 镜像并做相应配置；
* 用到了华为云镜像，但是替换路径的时候，
  有时候是 /etc/apt/sources.list，
  有时候是 /etc/apt/sources.list.d/debian.sources，
  报错的话，自行换着试试。

---

## ⚙️ 环境变量配置（`.env`）

| 变量名              | 描述                 |
| ---------------- | ------------------ |
| `HOST_IP`        | 本机局域网 IP，用于上网与 SDP |
| `DEFAULT_DOMAIN` | SIP 域名，建议填公网 IP    |

---

## 🔧 配置变更说明

### `etc/mysql/` 脚本变更

* `00_config_db.sh` 中使用 `rtpengine-create.sql` 替换 `rtpproxy-create.sql`
* `10_config_rtpproxy.sh` 中：

  * 表名改为：`rtpengine`
  * 字段改为：`socket`

### `etc/opensips-cp/image/modules.inc.php`

* 注释掉 `rtpproxy` 模块
* 打开 `rtpengine` 模块

### `etc/opensips/opensips.cfg` 关键改动

* 添加 WebSocket 监听：

  ```cfg
  socket=ws:${OPENSIPS_IP}:5066 as ${HOST_IP} use_workers 5
  loadmodule "proto_ws.so"
  ```

* 加载 `rtpengine` 模块，配置数据库连接：

  ```cfg
  loadmodule "rtpengine.so"
  modparam("rtpengine", "db_url", "mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@${MYSQL_IP}/${MYSQL_DATABASE}")
  ```

* SIP/WebSocket 协议判断逻辑：

  ```cfg
  if ($socket_in(proto) == "WS")
      setflag("SRC_WS");

  if (isflagset("SRC_WS"))
      setbflag("DST_WS");
  ```

* 注册路由限制单点登录：

  ```cfg
  save("location", "max-contacts=1,force-registration")
  ```

* 替换 `rtpproxy_offer` 为 `rtpengine_offer`：

  ```cfg
  if(rtpengine_offer("$var(rtpengine_flags)"))
  ```

* 替换 `rtpproxy_answer` 为 `rtpengine_answer`：

  ```cfg
  rtpengine_answer("$var(rtpengine_flags)");
  ```

* 替换 `rtpproxy_unforce()` 为：

  ```cfg
  rtpengine_delete();
  ```

---

## 🚀 启动方式

1. 克隆项目：

   ```bash
   git clone https://github.com/hello-ldf/opensips-softswitch-ce.git
   cd opensips-softswitch-ce
   ```

2. 配置 `.env` 文件（设置 IP 和域名）

3. 构建并启动服务：

   ```bash
   chmod +x ./etc/opensips/substenv.sh
   docker compose up
   ```

---

## 📌 备注

* 本分支修复了官方版本中数据库脚本与程序版本不匹配的问题（后续可能官方会修复此问题，建议关注官方更新）
* 替换为 RTPengine 是为了支持 WebRTC 场景（如 JsSIP）；

---

