#!/bin/bash
echo "Configuring OpenSIPS-CP database connection..."

sed -i "s/localhost/${MYSQL_IP}/g" /var/www/html/opensips-cp/config/db.inc.php

sed -i "s/127.0.0.1/${OPENSIPS_IP}/g" /var/www/html/opensips-cp/config/db_schema.mysql

TABLE_EXISTS=$(mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -e "SHOW TABLES LIKE 'ocp_admin_privileges';" -D ${MYSQL_DATABASE})

if [ -z "$TABLE_EXISTS" ]; then
    mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} < /var/www/html/opensips-cp/config/db_schema.mysql
fi

ACL_COLUMN_EXISTS=$(mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} \
                    -e "SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'subscriber' AND COLUMN_NAME = 'acls';")

if [ -z "$ACL_COLUMN_EXISTS" ]; then
    mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e "ALTER TABLE subscriber ADD COLUMN acls CHAR(64) DEFAULT '' NOT NULL;"
fi
