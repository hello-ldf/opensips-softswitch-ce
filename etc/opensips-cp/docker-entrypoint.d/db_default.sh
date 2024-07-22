#!/bin/bash

echo "Provisioning default data ..."

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e "
INSERT INTO rtpproxy_sockets (rtpproxy_sock, set_id)
SELECT 'udp:${RTPPROXY_IP}:${RTPPROXY_PORT}', 0
WHERE NOT EXISTS (
    SELECT 1 FROM rtpproxy_sockets WHERE rtpproxy_sock = 'udp:${RTPPROXY_IP}:${RTPPROXY_PORT}'
);"

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e "
INSERT INTO domain (domain)
SELECT '${DEFAULT_DOMAIN}'
WHERE NOT EXISTS (
    SELECT 1 FROM domain WHERE domain = '${DEFAULT_DOMAIN}'
);"
