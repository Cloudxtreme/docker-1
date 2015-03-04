DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 25:25 \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_DB=prod" \
	-e "NSQD_ADDRESS=10.8.0.1:4150" \
	-e "LOOKUPD_ADDRESS=10.8.0.1:4161" \
	-e "SMTP_ADDRESS=10.8.0.1:2525" \
	-e "DKIM_KEY=/keys/mailer.key" \
	-e "DKIM_SELECTOR=mailer" \
	-e "HOSTNAME=lavaboom.com" \
	-v /opt/api-keys:/keys \
	--link rethinkdb:rethinkdb \
	--name mailer-golang \
	registry.lavaboom.io/lavaboom/mailer-golang