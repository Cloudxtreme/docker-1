DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_KEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_ADDRESS=172.16.0.1:28015" \
	-e "RETHINKDB_DB=scheduler_master" \
	-e "NSQD_ADDRESS=172.16.0.1:4150" \
	--name worker-scheduler-master \
	registry.lavaboom.io/lavaboom/worker \
	scheduler