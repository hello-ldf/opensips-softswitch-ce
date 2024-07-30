
mysql opensips -e "UPDATE subscriber SET acls = 'E' WHERE username = '$1' AND domain = '$2';"
