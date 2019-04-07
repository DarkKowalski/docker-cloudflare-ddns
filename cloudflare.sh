#!/bin/sh

echo "Current time: $(date "+%Y-%m-%d %H:%M:%S")"

# Current IP address
IP=$(curl -sSL4 ip.sb)
echo "IP: $IP"

# Time to live for DNS record. Value of 1 is 'automatic'
TTL=120

# Whether the record is receiving the performance and security benefits of Cloudflare
PROXIED="false"

# Update Record
echo "Updating record: ${NAME} A ${IP}"

RESULT=$(curl -fsSL -X PUT "https://api.cloudflare.com/client/v4/zones/${ZONE_IDENTIFIER}/dns_records/${RECORD_IDENTIFIER}" \
     -H "X-Auth-Email: ${AUTH_EMAIL}" \
     -H "X-Auth-Key: ${AUTH_KEY}" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"${NAME}\",\"content\":\"${IP}\",\"ttl\":${TTL},\"proxied\":${PROXIED}}")

echo "Got result: ${RESULT}"