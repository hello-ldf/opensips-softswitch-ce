# OpenSIPS SoftSwitch - Community Edition

This project contains a fully functional OpenSIPS setup used as a SoftSwitch
that provides the following features:

* SIP Proxy with **support for TCP and UDP**
* **topology hiding** for all calls
* **dialplans** for user and did formats
* star codes to **enable/disable DND**
* **call forward** URIs for each user:
    * **always forward**
    * **busy forward**
    * **no answer forward**
    * **not found forward**
* **ACLs** for each user:
	* **User Enabled**
	* **Force NAT**
	* **Enable PSTN**
	* **DND**
	* **VM Enabled**
	* **VM Permanent Redirect**
	* **VM Redirect Not Found**
	* **VM Redirect on Busy**
	* **VM Redirect on No Answer**
* **RTPProxy** for voice traffic
* **FreeSWITCH** for media services:
    * **voicemails**
    * **announcements**

## Getting Started

The simplest way to get the project running is to setup [Docker](https://www.docker.com/) on your host and then run:

``` shell
git clone --recursive https://github.com/OpenSIPS/opensips-softswitch-ce.git
cd softswitch
docker compose up
```

For more information about setup, please check the [Setup
page](docs/setup.md).

Once everything is initialized, you should be able to access the OpenSIPS
Control Panel using the following credentials:

* URL: [http://localhost/cp](http://localhost/cp)
* User: `admin`
* Password: `opensips`

For more information about provisioning, please check the [Provisioning
page](docs/provisioning.md).


At this point you can follow the [Getting Started](docs/getting-started.md)
tutorial to test the OpenSIPS SoftSwitch Community Edition.

## Testing

OpenSIPS SoftwSwitch comes with a set of tests that you can run once the setup
is complete:
``` shell
./run-sipssert.sh
```

For more information, please check the [Testing page](docs/testing.md).

## OpenSIPS

OpenSIPS configuration is developed in a separate git repository that can be
found [here](https://github.com/OpenSIPS/opensips-softswitch-ce-config.git).

## Homer

In order to be able to visualize SoftSwitch call flows, it is recommended to
setup the [Homer](https://github.com/sipcapture/homer) tool by following [these](docs/homer.md)
steps.

## Documentation

Documentation pages contain the following topics:

* [Setup](docs/setup.md) - contains information about how to install and setup
* [Getting Started](docs/getting-started.md) - show how you can use the
SoftSwitch to test certain scenarios
* [Components](docs/components.md) - list of components used in the project
* [Provisioning](docs/provisioning.md) - useful information about provisioning
the platform
* [Testing](docs/testing.md) - information about testing the platform
* [Homer](docs/homer.md) - information about setting up Homer server
* [Devel](docs/devel.md) - information about development


## Contribute

This project is Community driven, therefore any contribution is welcome. Feel
free to open a pull request for any fix/feature you find useful.

## License

<!-- License source -->
[License-GPLv3]: https://www.gnu.org/licenses/gpl-3.0.en.html "GNU GPLv3"
[Logo-CC_BY]: https://i.creativecommons.org/l/by/4.0/88x31.png "Creative Common Logo"
[License-CC_BY]: https://creativecommons.org/licenses/by/4.0/legalcode "Creative Common License"

The `OpenSIPS SoftSwitch Community Edition` source code is licensed under the [GNU General Public License v3.0][License-GPLv3]

All documentation files (i.e. `.md` extension) are licensed under the [Creative Common License 4.0][License-CC_BY]

![Creative Common Logo][Logo-CC_BY]

© 2024 - SIP Point Consulting SRL
