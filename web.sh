DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig docker0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')

docker run \
	-d \
	-p $lanIP:10010:80 \
	--name web-master \
	--restart always \
	quay.io/lavab/web
