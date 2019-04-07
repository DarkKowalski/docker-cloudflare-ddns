FROM alpine:3.6

ADD crontab-conf /var/spool/cron/crontabs/root
ADD cloudflare.sh /cloudflare-ddns/cloudflare.sh
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENV AUTH_EMAIL AUTH_KEY ZONE_IDENTIFIER RECORD_IDENTIFIER NAME

RUN chmod 775 /cloudflare-ddns/cloudflare.sh \
	&& chmod 775 /usr/local/bin/docker-entrypoint.sh \
	&& apk add --no-cache curl

ENTRYPOINT ["docker-entrypoint.sh"]
CMD /cloudflare-ddns/cloudflare.sh \
	&& crond -f
