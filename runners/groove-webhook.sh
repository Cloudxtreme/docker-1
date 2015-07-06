DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_DATABASE=prod" \
	-e "RETHINKDB_ADDRESS=172.16.0.1:28015" \
	-e "PRIVATE_KEY=/keys/hello.key" \
	-e "GROOVE_ADDRESS=lavab@inbox.groovehq.com" \
	-e "FORWARDING_SERVER=172.16.0.1:2525" \
	-e "DKIM_KEY=/keys/default.private" \
	-v /opt/api-keys:/keys \
	-p 172.16.0.1:1000:8000 \
	--restart always \
	--name groove-webhook \
	lavab/groove-webhook
