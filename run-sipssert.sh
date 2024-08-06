#!/bin/bash

TESTS_DIR=${1:-sipssert}

docker run --rm -it \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v "$(pwd)/${TESTS_DIR}":"$(pwd)/${TESTS_DIR}" \
	-w "$(pwd)/${TESTS_DIR}" \
	opensips/sipssert .
