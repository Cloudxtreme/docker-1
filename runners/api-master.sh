# Lavaboom API
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Launches the API on port 5000

DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10000:5000 \
	-e "RETHINKDB_DB=prod" \
	-e "API_HOST=api.lavaboom.com" \
	-e "EMAIL_DOMAIN=lavaboom.com" \
	-v /opt/api-keys:/keys \
	--name api-master \
	lavab/api \
	-redis_address=172.16.0.1:6379 \
	-redis_db=1 \
	-lookupd_address=172.16.0.1:4161 \
	-nsqd_address=172.16.0.1:4150 \
	-rethinkdb_address=172.16.0.1:28015 \
	-bloom_filter=/keys/bloom.db \
	-raven_dsn=https://aaab917804ac489ea883e63312bf96ca:bdccb64b394344df8f2eeac8ad90fc81@sentry.lavaboom.io/4
