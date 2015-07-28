DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_ADDRESS=10.8.0.3:28015" \
	-e "RETHINKDB_DB=scheduler_develop" \
	-e "LOOKUPD_ADDRESS=10.8.0.3:4161" \
	--name worker-runner-develop \
	registry.lavaboom.io/lavaboom/worker \
	runner