DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_DATABASE=prod" \
	-e "RETHINKDB_ADDRESS=172.16.0.1:28015" \
	-e "SMTPD_ADDRESS=172.16.0.1:2525" \
	-e "DKIM_KEY=/keys/default.private" \
	-v /opt/api-keys:/keys \
	-p 172.16.0.1:1001:8000 \
	--restart always \
	--name onboarding-webhook \
	lavab/onboarding-webhook
