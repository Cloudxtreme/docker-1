DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
lookupdIP=$lanIP

docker run \
	-d \
	-e "RETHINKDB_ADDRESS=$lanIP:28015" \
	-e "NSQD_ADDRESS=$lanIP:4150" \
	-e "LOOKUPD_ADDRESS=$lookupdIP:4161" \
	-e "USERNAMES=hello" \
	-e "PASSWORDS=265677564b7e2460e1371ce9ad231fa7c5c5b38e0a4802359f6508df17ce40ea" \
	-e "PRIVATE_KEYS=/keys/hello.key" \
	-e "GROOVE_ADDRESS=lavab@inbox.groovehq.com" \
	-e "FORWARDING_SERVER=$lanIP:2525" \
	-e "DKIM_KEY=/keys/default.private" \
	-e "ENABLE_RECEIVER=false" \
	-v /opt/api-keys:/keys \
	--restart always \
	--name lavabot \
	quay.io/lavab/lavabot
