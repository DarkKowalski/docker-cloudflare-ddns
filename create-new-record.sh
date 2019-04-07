#!/bin/bash

# account config
AUTH_EMAIL="user@example.com"
AUTH_KEY="114514"
ZONE_IDENTIFIER="1919810"
NAME="site.example.com"

echo -e "Creating record: ${NAME} A 127.0.0.1"

RESULT=$(curl -fsSL -X POST "https://api.cloudflare.com/client/v4/zones/${ZONE_IDENTIFIER}/dns_records" \
     -H "X-Auth-Email: ${AUTH_EMAIL}" \
     -H "X-Auth-Key: ${AUTH_KEY}" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"${NAME}\",\"content\":\"127.0.0.1\",\"ttl\":1,\"proxied\":false}")

echo "Got result: ${RESULT}"

if grep '"success":true' <<< ${RESULT} >/dev/null ;then
        echo "The result is positive."
        exit 0; 
else
        echo "The result is negative."
        exit 1; 
fi