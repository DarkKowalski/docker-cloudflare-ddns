# docker-cloudflare-ddns
## Usage
```bash
docker run -d \
        -e AUTH_EMAIL="user@example.com" \
        -e AUTH_KEY="114514" \
        -e ZONE_IDENTIFIER="1919" \
        -e RECORD_IDENTIFIER="810" \
        -e NAME="site.example.com" \
        -it darkkowalski/docker-cloudflare-ddns
```
## Note
If DNS record doesn't exist, create it first to get `RECORD_IDENTIFIER`

Sample script: [creat-new-record.sh](https://github.com/DarkKowalski/docker-cloudflare-ddns/blob/master/create-new-record.sh)
