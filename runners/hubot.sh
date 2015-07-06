DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:18080:8080 \
	-e "HUBOT_SLACK_TOKEN=xoxb-3372140680-00BI4bVxg4tGRSPzgDKJhXbu" \
	-e "RETHINKDB_PORT_28015_TCP_ADDR=172.16.0.1" \
	--link redis:redis \
	--name hubot \
	--restart always \
	lavab/hubot
