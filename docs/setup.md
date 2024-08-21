# OpenSIPS SoftSwitch - Community Edition - Setup

## Prerequisites

**TODO**: document [Docker](https://www.docker.com/) and [Docker
Compose](https://docs.docker.com/compose/) requirements.
**TODO**: specify that git is a must

## Network

**TODO**: describe the network we are using
**TODO**: details about `HOST_IP` and its importance

## Configuration

There is the `.env` file where you can set up the following variables:
- `HOST_IP`: IP address of a interface from the host machine; defaults to the
first IP associated on the host
- `NETWORK`: IP addresses class for Docker containers in CIDR notation (IP/mask);
default is `172.72.0.0/24`
- `OPENSIPS_IP`: IP address of the OpenSIPS container; default is `172.72.0.2`
- `MYSQL_IP`: IP address of the MySQL container; default is `172.72.0.3`
- `MYSQL_ROOT_PASSWORD`: root password for MySQL container; default is `root`
- `MYSQL_DATABASE`: database name for OpenSIPS; default is `opensips`
- `MYSQL_USER`: database user for OpenSIPS; default is `opensips`
- `MYSQL_PASSWORD`: password for OpenSIPS database user; default is
`opensipsrw`
- `CP_IP`: IP address of the OpenSIPS-CP container; default is `172.72.0.4`
- `RTPPROXY_IP`: IP address of the RTPProxy container; default is `172.72.0.5`
- `RTPPROXY_PORT`: listening port for RTPProxy; default is `7899`
- `MINPORT`: minimum of the port range for RTPProxy; default is `30000`
- `MAXPORT`: maximum of the port range for RTPProxy; default is `30100`
- `FREESWITCH_IP`: IP address of the FreeSWITCH container; default is
`172.72.0.6`
- `ENABLE_HOMER`: enable or disable Homer SIP capture (`yes`/`no`); check the [Homer](homer.md) section to enable it; default is `no`/disabled
- `DEFAULT_DOMAIN`: a default domain provided for OpenSIPS; default is
`domain.sip`

## Start Service

Once the configuration is finalized (i.e. editting the `.env` file), you can
start the service using:
```
docker-compose up
```
