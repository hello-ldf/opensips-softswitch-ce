mysql opensips -e "DELETE FROM domain WHERE domain = '$1';"

result=$(mysql opensips -se "SELECT domain FROM domain WHERE domain = '$1';")

if [[ "$result" == "$1" ]]; then
    echo "DOMAIN NOT REMOVED"
    exit 1
else
    echo "DOMAIN REMOVED"
    exit 0
fi
