DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_ADDRESS=10.8.0.2:28015" \
	-e "RETHINKDB_DB=scheduler-staging" \
	-e "NSQD_ADDRESS=10.8.0.2:4150" \
	--name worker-scheduler-staging \
	registry.lavaboom.io/lavaboom/worker \
	scheduler