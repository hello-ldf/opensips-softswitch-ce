# OpenSIPS SoftSwitch - Community Edition - Provisioning

The SoftSwitch can be provisioned through different interfaces

## OpenSIPS Control Panel

The simplest way to provision the SoftSwitch is through the OpenSIPS Control Panel. You can access it at [http://localhost/cp](http://localhost/cp) using the following credentials:
* username: `admin`
* password: `opensips`

Here you can use various web interface tools to manage: **users**, **aliases**, **domains**, **PSTN traffic**, **dialplans**. 
You can also send **MI commands** to OpenSIPS or view **statistics** and **logs**.

## OpenSIPS CLI

You can run CLI commands by running the following command to execute `opensips-cli` in the OpenSIPS container:
```shell
docker exec -it opensips opensips-cli  # to enter in interactive mode
Welcome to OpenSIPS Command Line Interface!
(opensips-cli):

# or run a single command, for example:
docker exec -it opensips opensips-cli -x mi reload_routes
```

## MySQL

You can also provision the SoftSwitch by directly accessing the MySQL database.

```shell
# using a Docker exec command to access the MySQL container
docker exec -it mysql mysql -uopensips -popensipsrw -D opensips

# or use the IP address and port
mysql -h $MYSQL_IP --port=$MYSQL_PORT -uopensips -popensipsrw -D opensips
```
