mysql opensips -e "UPDATE subscriber SET acls = REPLACE(acls, 'P', '') WHERE username = '$1' AND domain = '$2';"
