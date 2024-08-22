mysql opensips -e "UPDATE subscriber SET acls = CONCAT(acls, '45') WHERE username = '$1' AND domain = '$2';"
