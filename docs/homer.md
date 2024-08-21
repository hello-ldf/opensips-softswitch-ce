# OpenSIPS SoftSwitch - Community Edition - Homer

The [Homer](https://github.com/sipcapture/homer) project can be used to capture and analyze call flows.
There is a containerized version of Homer available [here](https://github.com/sipcapture/homer-docker).

## Installation

To install Homer, you need to clone the repository and start the containers:

```shell
git clone https://github.com/sipcapture/homer-docker.git
cd homer-docker/all-in-one
docker compose up -d  # or docker-compose up -d
```

A web interface will be available at [http://localhost:3000](http://localhost:3000) with the following credentials:
* username: `admin`
* password: `admin`

Homer will listen for HEP traffic on port 9060 and will be accessible via port forwarding from the host machine.

After setting up Homer, you need to enable it in the environment file; edit
`.env` and switch the `ENABLE_HOMER=yes`; Make sure `HOMER_IP` and
`HOMER_PORT` variables are pointing to the correct values (`HOST_IP:9060`).
