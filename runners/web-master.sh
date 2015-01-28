DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10010:80 \
	--name web-master \
	registry.lavaboom.io/lavaboom/web-master

