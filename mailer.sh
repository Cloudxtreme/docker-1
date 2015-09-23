DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig docker0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
lookupdIP=$lanIP

docker run \
	-d \
	-p 25:25 \
	-e "RETHINKDB_DB=prod" \
	-e "NSQD_ADDRESS=$lanIP:4150" \
	-e "LOOKUPD_ADDRESS=$lookupdIP:4161" \
	-e "SMTP_ADDRESS=$lanIP:2525" \
	-e "SPAMD_ADDRESS=$lanIP:783" \
	-e "DKIM_KEY=/keys/default.private" \
	-e "DKIM_SELECTOR=mailer" \
	-e "HOSTNAME=lavaboom.com" \
	-e "RETHINKDB_ADDRESS=$lanIP:28015" \
	-e "RAVEN_DSN=https://651f74c0a2204eee8bcc9892f6c6fd3f:f384b4f053e24bbbb0f3d416dae2ee3c@sentry.lavaboom.io/2" \
	-v /opt/api-keys:/keys \
	--restart always \
	--name mailer \
	quay.io/lavab/mailer
