# OpenSIPS SoftSwitch - Community Edition - Components

This platform uses the following compoents/docker images:

- **mysql**: MySQL database server; used to store OpenSIPS data;
    - *ports*: **3306** (by default, but can be changed in [.env](/.env) file at `MYSQL_PORT`)
    - this port can be used to connect to the database from outside Docker environment
    and manually inspect the database; use `MYSQL_USER`, `MYSQL_PASSWORD` and `MYSQL_DATABASE` from [.env](/.env) file
- **opensips**: OpenSIPS SIP server; used to handle SIP traffic;
    - *ports*: **5060** (for both UDP and TCP connections), **8888** (for OpenSIPS Management Interface)
    - **8888** can be used to send MI commands to OpenSIPS server from outside Docker environment (e.g. using `opensips-cli` tool)
- **opensips-cp**: OpenSIPS Control Panel; used to manage SoftSwitch platform;
    - *ports*: **80** (used to access the web interface from browser)
    - you can access it at `http://localhost/cp` with default credentials `admin:opensips`
- **rtpproxy**: RTP proxy server; used to handle RTP traffic;
    - *ports*: **MINPORT**-**MAXPORT** (by default, **30000**-**30100**, but can be changed in [.env](/.env) file)
    - these ports are meant to be used to send voice traffic
- **freeswitch**: FreeSWITCH media server; used for voicemails and announcements; **no ports opened** to the world;
