mysql opensips -e "UPDATE subscriber SET acls = '' WHERE username = '$1' AND domain = '$2';"

result=$(mysql opensips -se "SELECT acls FROM subscriber WHERE username = '$1' AND domain = '$2';")

if [[ "$result" == "" ]]; then
    echo "ACL DISABLED"
    exit 0
else
    echo "ACL ENABLED"
    exit 1
fi
