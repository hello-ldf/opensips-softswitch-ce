#!/bin/bash

echo "Configuring OpenSIPS CP Dialplan Tool ..."

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e \
	"INSERT INTO dialplan (dpid, match_op, match_exp, attrs)
	 SELECT '${DEFAULT_DIALPLAN}', 1, '${DEFAULT_REGEX}', 'DP_USER'
		 WHERE NOT EXISTS (
		 SELECT 1 FROM dialplan WHERE dpid = '${DEFAULT_DIALPLAN}' AND match_op = 1 AND match_exp = '${DEFAULT_REGEX}');"
