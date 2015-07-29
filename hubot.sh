DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')

docker run \
	-d \
	-p 127.0.0.1:18080:8080 \
	-e "HUBOT_SLACK_TOKEN=xoxb-3372140680-00BI4bVxg4tGRSPzgDKJhXbu" \
	-e "RETHINKDB_PORT_28015_TCP_ADDR=$lanIP" \
	--link redis:redis \
	--name hubot \
	--restart always \
	quay.io/lavab/hubot
