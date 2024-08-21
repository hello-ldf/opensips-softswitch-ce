# OpenSIPS SoftSwitch - Community Edition - Development

This document contains information about development of the platform.

## Structure

This repository contains the following directory structure:

* [**docs/**](/docs/): contains documentation files
* [**etc/**](/etc/):
    * [**opensips/**](/etc/opensips/): subproject for OpenSIPS configuration files; contains [opensips.cfg](/etc/opensips/opensips.cfg) and other configuration files
    * [**opensips-cp/**](/etc/opensips-cp/):
        * [**docker-entrypoint.d/**](/etc/opensips-cp/docker-entrypoint.d/): scripts that are executed when the container starts (e.g. to set up the database)
            * [**user_management/**](/etc/opensips-cp/docker-entrypoint.d/user_management/): php files for that implement ACLs for user management tool
        * [**image/**](/etc/opensips-cp/image/): [modules.inc.php](/etc/opensips-cp/image/modules.inc.php) file where modules can be enabled/disabled for OpenSIPS Control Panel
    * [**mysql/**](/etc/mysql/): scripts to initialize the MySQL database schema
    * [**freeswitch/**](/etc/freeswitch/):
        * [**conf/**](/etc/freeswitch/conf/): scripts that are executed when the container starts
        * [**dialplan/**](/etc/freeswitch/dialplan/): xml files that define voicemail and announcements extensions for FreeSWITCH
* [**sipssert/**](/sipssert/): contains a suite of tests for the platform to be run with SIPssert framework
* [**docker-compose.yml**](/docker-compose.yml): main file that defines services, networks and volumes for the platform
* [**.env**](/.env): environment file that contains configuration for the platform
* [**run-sipssert.sh**](/run-sipssert.sh): script that runs the SIPssert tests (in a Docker container, no need to install SIPssert locally)
