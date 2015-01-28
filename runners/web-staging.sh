DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10011:80 \
	--name web-staging \
	registry.lavaboom.io/lavaboom/web-staging

