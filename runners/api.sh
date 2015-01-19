# Lavaboom API
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Launches the API on port 5000

DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:5000:5000 \
	-e "RETHINKDB_AUTHKEY=d0llad0llabilly4ll_rethinkdb" \
	-e "API_HOST=api.lavaboom.io" \
	-v /opt/api-keys:/keys \
	--link rethinkdb:rethinkdb \
	--link redis:redis \
	--link nats:nats \
	--name api \
	registry.lavaboom.io/lavaboom/api \
	-loggly_token=4775dd8a-72a1-4c28-aeb6-7fe7d18b3215 \
        -etcd-address=https://etcd0.lavaboom.io:4001,https://etcd1.lavaboom.io:4001,https://etcd2.lavaboom.io:4001 \
        -etcd-ca-file=/keys/ca.crt \
        -etcd-cert-file=/keys/lisa.crt \
        -etcd-key-file=/keys/lisa.key \
        -etcd-path=settings/
