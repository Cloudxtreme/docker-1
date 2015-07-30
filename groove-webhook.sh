DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')

docker run \
	-d \
	-e "RETHINKDB_DATABASE=prod" \
	-e "RETHINKDB_ADDRESS=$lanIP:28015" \
	-e "PRIVATE_KEY=/keys/hello.key" \
	-e "GROOVE_ADDRESS=lavab@inbox.groovehq.com" \
	-e "FORWARDING_SERVER=$lanIP:2525" \
	-e "DKIM_KEY=/keys/default.private" \
	-v /opt/api-keys:/keys \
	-p $lanIP:1000:8000 \
	--restart always \
	--name groove-webhook \
	quay.io/lavab/groove-webhook
