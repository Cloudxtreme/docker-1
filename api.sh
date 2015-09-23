DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig docker0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
lookupdIP=$lanIP
docker run \
	-d \
	-p $lanIP:10000:5000 \
	-e "RETHINKDB_DB=prod" \
	-v /opt/api-keys:/keys \
	--name api-master \
	--restart always \
	quay.io/lavab/api \
	-redis_address=$lanIP:6379 \
	-redis_db=1 \
	-lookupd_address=$lookupdIP:4161 \
	-nsqd_address=$lanIP:4150 \
	-rethinkdb_address=$lanIP:28015 \
	-bloom_filter=/keys/bloom.db \
	-raven_dsn=https://aaab917804ac489ea883e63312bf96ca:bdccb64b394344df8f2eeac8ad90fc81@sentry.lavaboom.io/4
