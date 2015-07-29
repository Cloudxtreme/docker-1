DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')

docker run \
	-d \
	-e "RETHINKDB_DB=prod" \
	-e "RETHINKDB_ADDRESS=$lanIP:28015" \
	-e "LOOKUPD_ADDRESS=$lanIP:4161" \
	--restart always \
	--name webhook \
	quay.io/lavab/webhook
