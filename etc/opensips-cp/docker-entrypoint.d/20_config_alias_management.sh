#!/bin/bash

cd "$(dirname "$0")"
. functions

echo "Configuring OpenSIPS CP Alias Management Tool ..."

add_parameter alias_management table_aliases "UNHEX('7B224442616C6961736573223A226462616C6961736573222C2244494453616C6961736573223A2264696473227D')"
