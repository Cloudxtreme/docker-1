DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 25:25 \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_DB=dev" \
	-e "LOOKUPD_ADDR=10.8.0.2:4160" \
	-v /opt/api-keys:/keys \
	--link rethinkdb:rethinkdb \
	--name mailer-develop \
	registry.lavaboom.io/lavaboom/mailer-develop