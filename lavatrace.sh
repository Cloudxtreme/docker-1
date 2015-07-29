DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')

docker run \
	-d \
	-e "RETHINKDB_ADDRESS=$lanIP:28015" \
	-e "ADMIN_TOKEN=TyTpfuyiXZWJWMj7ztKF" \
	-e "RAVEN_DSN=https://e81228f5b961473ba110d9b4dfd45d43:d1044c64a40245a0a4fae7d3893c3d21@sentry.lavaboom.io/2" \
	-p 127.0.0.1:14000:8000 \
	--restart always \
	--name lavatrace \
	quay.io/lavab/lavatrace
