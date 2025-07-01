#!/bin/bash

chmod -R 755 /var/www/html/opensips-cp/config

cd "$(dirname "$0")"
. functions

echo "Configuring OpenSIPS-CP database connection..."

sed -i "s/localhost/${MYSQL_IP}/g" /var/www/html/opensips-cp/config/db.inc.php

sed -i "s/127.0.0.1/${OPENSIPS_IP}/g" /var/www/html/opensips-cp/config/db_schema.mysql

add_table /var/www/html/opensips-cp/config/db_schema.mysql
