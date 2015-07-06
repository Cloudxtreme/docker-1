DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 172.16.0.1:2525:25 \
	--restart always \
	--name postfix \
	lavab/postfix
