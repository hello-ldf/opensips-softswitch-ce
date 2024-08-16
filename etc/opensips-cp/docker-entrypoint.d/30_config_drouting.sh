#!/bin/bash

cd "$(dirname "$0")"
. functions

echo "Configuring OpenSIPS CP Dynamic Routing Tool..."

add_parameter drouting group_ids_file "UNHEX('7B2231223A2244656661756C74227D')"
add_parameter drouting tabs "UNHEX('67617465776179732E7068702C63617272696572732E7068702C72756C65732E706870')"
