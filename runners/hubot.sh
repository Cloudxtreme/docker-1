DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:18080:8080 \
	-e "RETHINKDB_AUTHKEY=d0llad0llabilly4ll_rethinkdb" \
	-e "HUBOT_SLACK_TOKEN=xoxb-3372140680-00BI4bVxg4tGRSPzgDKJhXbu" \
	--link rethinkdb:rethinkdb \
	--link redis:redis \
	--name hubot \
	--restart always \
	lavaboom/hubot
