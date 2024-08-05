mysql opensips -e "UPDATE subscriber SET acls = REPLACE(REPLACE(acls, '4', ''), '6', '') WHERE username = '$1' AND domain = '$2';"
