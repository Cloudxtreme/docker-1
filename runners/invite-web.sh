DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10020:80 \
	--name invite-web \
	registry.lavaboom.io/lavaboom/invite-web

