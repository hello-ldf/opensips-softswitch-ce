mysql opensips -e "UPDATE subscriber SET acls = CONCAT(acls, 'D') WHERE username = '$1' AND domain = '$2';"
