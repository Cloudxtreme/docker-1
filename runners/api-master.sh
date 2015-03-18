# Lavaboom API
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Launches the API on port 5000

DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10000:5000 \
	-e "RETHINKDB_AUTHKEY=d0llad0llabilly4ll_rethinkdb" \
	-e "RETHINKDB_DB=prod" \
	-e "API_HOST=api.lavaboom.com" \
	-e "EMAIL_DOMAIN=lavaboom.com" \
	-v /opt/api-keys:/keys \
	--link rethinkdb:rethinkdb \
	--name api-master \
	registry.lavaboom.io/lavaboom/api-master \
	-loggly_token=4775dd8a-72a1-4c28-aeb6-7fe7d18b3215 \
	-slack_url=https://hooks.slack.com/services/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 \
	-slack_level=warn \
	-slack_username=api.lavaboom.com \
	-redis_address=172.16.0.1:6379 \
	-redis_db=1 \
	-lookupd_address=172.16.0.1:4161 \
	-nsqd_address=172.16.0.1:4150
