#!/bin/bash

cd "$(dirname "$0")"
. functions

TABLE_FILES=(
    "acc-create.sql"
    "alias_db-create.sql"
    "auth_db-create.sql"
    "authjwt-create.sql"
    "b2b-create.sql"
    "b2b_sca-create.sql"
    "cachedb_sql-create.sql"
    "carrierroute-create.sql"
    "cpl-create.sql"
    "db-migrate.sql"
    "dialog-create.sql"
    "dialplan-create.sql"
    "dispatcher-create.sql"
    "domain-create.sql"
    "domainpolicy-create.sql"
    "drouting-create.sql"
    "emergency-create.sql"
    "fraud_detection-create.sql"
    "freeswitch_scripting-create.sql"
    "group-create.sql"
    "imc-create.sql"
    "msilo-create.sql"
    "presence-create.sql"
    "qrouting-create.sql"
    "ratecacher-create.sql"
    "registrant-create.sql"
    "rls-create.sql"
    "rtpproxy-create.sql"
    "speeddial-create.sql"
    "sqlops-create.sql"
    "table-migrate.sql"
    "tracer-create.sql"
    "userblacklist-create.sql"
    "usrloc-create.sql"
)

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

for file in "${TABLE_FILES[@]}"; do
    add_table /usr/share/opensips/mysql/$file
done

add_table /var/www/html/opensips-cp/config/db_schema.mysql
