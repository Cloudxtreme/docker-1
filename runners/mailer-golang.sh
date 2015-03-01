DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 25:25 \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_DB=dev" \
	-e "NSQD_ADDRESS=10.8.0.2:4150" \
	-v /opt/api-keys:/keys \
	--link rethinkdb:rethinkdb \
	--name mailer-golang \
	registry.lavaboom.io/lavaboom/mailer-golang