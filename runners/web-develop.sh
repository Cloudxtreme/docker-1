DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10012:80 \
	--name web-develop \
	registry.lavaboom.io/lavaboom/web-develop

