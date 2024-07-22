#!/bin/bash

echo "Configuring OpenSIPS CP User Management Tool ..."

# Password Mode
mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e \
	"INSERT INTO ocp_tools_config (module, param, value)
	 SELECT 'user_management', 'passwd_mode', '1'
		 WHERE NOT EXISTS (
		 SELECT 1 FROM ocp_tools_config WHERE module = 'user_management' AND param = 'passwd_mode');"

# ACLs
cp -u user_management/acls.inc.php /var/www/html/opensips-cp/config/tools/users/user_management/
cp -u user_management/user_management_acls.php /var/www/html/opensips-cp/config/tools/users/user_management/

ACL_COLUMN_EXISTS=$(mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e \
	"SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'subscriber' AND COLUMN_NAME = 'acls';")

[ -z "$ACL_COLUMN_EXISTS" ] && mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e \
	"ALTER TABLE subscriber ADD COLUMN acls CHAR(64) DEFAULT '' NOT NULL;"
