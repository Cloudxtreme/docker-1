DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_ADDRESS=10.8.0.1:28015" \
	-e "RETHINKDB_DB=scheduler_master" \
	-e "LOOKUPD_ADDRESS=10.8.0.1:4161" \
	--name worker-runner-master \
	registry.lavaboom.io/lavaboom/worker \
	runner