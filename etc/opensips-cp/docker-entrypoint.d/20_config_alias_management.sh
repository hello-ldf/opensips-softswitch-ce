#!/bin/bash

cd "$(dirname "$0")"
. functions

echo "Configuring OpenSIPS CP Alias Management Tool ..."

add_parameter alias_management table_aliases "'{\"DIDs\":\"dids\", \"DBaliases\":\"dbaliases\"}'"
