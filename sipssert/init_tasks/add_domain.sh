mysql opensips -e "INSERT INTO domain (domain) VALUES ('$1');"

result=$(mysql opensips -se "SELECT domain FROM domain WHERE domain = '$1';")

if [[ "$result" == "$1" ]]; then
    echo "DOMAIN ADDED"
    exit 0
else
    echo "DOMAIN NOT ADDED"
    exit 1
fi
