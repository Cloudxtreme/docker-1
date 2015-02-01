# Lavaboom API
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Launches the API on port 5000

DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10002:5000 \
	-e "RETHINKDB_AUTHKEY=d0llad0llabilly4ll_rethinkdb" \
        -e "RETHINKDB_DB=dev" \
	-e "API_HOST=api.lavaboom.de" \
	-e "EMAIL_DOMAIN=lavaboom.de" \
	-v /opt/api-keys:/keys \
	--link rethinkdb:rethinkdb \
	--link redis:redis \
	--link nats:nats \
	--name api-develop \
	registry.lavaboom.io/lavaboom/api-develop \
	-loggly_token=4775dd8a-72a1-4c28-aeb6-7fe7d18b3215 \
        -etcd_address=https://etcd0.lavaboom.io:4001,https://etcd1.lavaboom.io:4001,https://etcd2.lavaboom.io:4001 \
        -etcd_ca_file=/keys/ca.crt \
        -etcd_cert_file=/keys/lisa.crt \
        -etcd_key_file=/keys/lisa.key \
        -etcd_path=api-develop/ \
	-slack_url=https://hooks.slack.com/services/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 \
	-slack_levels=warn \
	-slack_username=api.lavaboom.co
