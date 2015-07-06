DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10021:8000 \
	-e "RETHINKDB_ADDRESS=172.16.0.1:28015" \
	--name invite-api \
	lavab/invite-api
