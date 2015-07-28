DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:10020:80 \
	--name invite-web \
	lavab/invite-web

