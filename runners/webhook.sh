DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_DB=prod" \
	-e "RETHINKDB_ADDRESS=172.16.0.1:28015" \
	-e "LOOKUPD_ADDRESS=172.16.0.1:4161" \
	--restart always \
	--name webhook \
	lavab/webhook
