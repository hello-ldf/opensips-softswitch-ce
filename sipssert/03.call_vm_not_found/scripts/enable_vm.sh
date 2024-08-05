mysql opensips -e "UPDATE subscriber SET acls = CONCAT(acls, '46') WHERE username = '$1' AND domain = '$2';"
