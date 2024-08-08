mysql opensips -e "UPDATE subscriber SET acls = REPLACE(acls, 'D', '') WHERE username = '$1' AND domain = '$2';"
