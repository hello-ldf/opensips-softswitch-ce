#!/bin/bash

cd "$(dirname "$0")"
. functions

echo "Configuring OpenSIPS-CP database connection..."

sed -i "s/localhost/${MYSQL_IP}/g" /var/www/html/opensips-cp/config/db.inc.php

sed -i "s/127.0.0.1/${OPENSIPS_IP}/g" /var/www/html/opensips-cp/config/db_schema.mysql

apt-get update && apt-get install -y curl

curl https://apt.opensips.org/opensips-org.gpg -o /usr/share/keyrings/opensips-org.gpg
echo "deb [signed-by=/usr/share/keyrings/opensips-org.gpg] https://apt.opensips.org bullseye 3.6-nightly" >/etc/apt/sources.list.d/opensips.list

apt-get update && apt-get install -y opensips-mysql-dbschema

until mysqladmin ping -h ${MYSQL_IP} --silent; do
    echo "MySQL server is not yet available. Retrying in 1 second..."
    sleep 1
done

add_table /usr/share/opensips/mysql/standard-create.sql

rm -f /usr/share/opensips/mysql/standard-create.sql

for file in /usr/share/opensips/mysql/*.sql; do
    add_table $file
done

add_table /var/www/html/opensips-cp/config/db_schema.mysql
