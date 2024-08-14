mysql opensips -e "UPDATE subscriber SET acls = REPLACE(acls, '4', '') WHERE username = '$1' AND domain = '$2';"
