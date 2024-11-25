mysql opensips -e "UPDATE subscriber SET acls = REPLACE(acls, 'E', '') WHERE username = '$1' AND domain = '$2';"
