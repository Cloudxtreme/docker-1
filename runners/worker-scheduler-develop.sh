DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_ADDRESS=10.8.0.3:28015" \
	-e "RETHINKDB_DB=scheduler-develop" \
	-e "NSQD_ADDRESS=10.8.0.3:4150" \
	--name worker-scheduler-develop \
	registry.lavaboom.io/lavaboom/worker \
	scheduler