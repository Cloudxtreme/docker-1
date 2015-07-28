DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-e "RETHINKDB_ADDRESS=172.16.0.1:28015" \
	-e "ADMIN_TOKEN=TyTpfuyiXZWJWMj7ztKF" \
	-e "RAVEN_DSN=https://e81228f5b961473ba110d9b4dfd45d43:d1044c64a40245a0a4fae7d3893c3d21@sentry.lavaboom.io/2" \
	-p 127.0.0.1:14000:8000 \
	--restart always \
	--name lavatrace \
	lavab/lavatrace
