DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 25:25 \
	-e "RETHINKDB_AUTHKEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_DB=dev" \
	-v /opt/api-keys:/keys \
	--link rethinkdb:rethinkdb \
	--link nats:nats \
	--name mailer-develop \
	registry.lavaboom.io/lavaboom/mailer-develop