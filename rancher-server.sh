DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	--restart=always \
	-e "CATTLE_API_ALLOW_CLIENT_OVERRIDE=true" \
	-e "CATTLE_HOST_API_PROXY_SCHEME=wss" \
	-p 127.0.0.1:9001:8080 \
	--name rancher-server \
	rancher/server
