# OpenSIPS SoftSwitch - Community Edition

This project contains a fully functional OpenSIPS setup used as a SoftSwitch.

## Getting started

### Installation

Clone the repository:
``` shell
git clone --recursive https://gitlab.opensips-solutions.com:44344/ce/softswitch.git
```

### Configuration

There is the `.env` file where you can set up the following variables:
- `HOST_IP`: IP address of a interface from the host machine
- `NETWORK`: IP addresses class for Docker containers in CIDR notation (IP/mask)
- `OPENSIPS_IP`: IP address of the OpenSIPS container
- `MYSQL_IP`: IP address of the MySQL container
- `MYSQL_ROOT_PASSWORD`: root password for MySQL container
- `MYSQL_DATABASE`: database name for OpenSIPS
- `MYSQL_USER`: database user for OpenSIPS
- `MYSQL_PASSWORD`: password for OpenSIPS database user
- `CP_IP`: IP address of the Opensips-CP container
- `RTPPROXY_IP`: IP address of the RTPProxy container
- `RTPPROXY_PORT`: listening port for RTPProxy
- `MINPORT`: minimum of the port range for RTPProxy
- `MAXPORT`: maximum of the port range for RTPProxy
- `FREESWITCH_IP`: IP address of the FreeSWITCH container
- `ENABLE_HOMER`: enable or disable Homer SIP capture (`yes`/`no`)
- `DEFAULT_DOMAIN`: a default domain provided for OpenSIPS

### Get up and running

First, you need to put your IP address in the `HOST_IP` variable in `.env` file (**very important**).
Then, you can start the SoftSwitch with the following command:
``` shell
docker-composer up --build
```
