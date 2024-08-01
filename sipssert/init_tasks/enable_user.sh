mysql opensips -e "UPDATE subscriber SET acls = 'E' WHERE username = '$1' AND domain = '$2';"

result=$(mysql opensips -se "SELECT acls FROM subscriber WHERE username = '$1' AND domain = '$2';")

if [[ "$result" == "E" ]]; then
    echo "ACL ENABLED"
    exit 0
else
    echo "ACL NOT ENABLED"
    exit 1
fi
