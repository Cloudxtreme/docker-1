DEBIAN_FRONTEND=noninteractive

lanIP=$(/sbin/ifconfig docker0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
docker run \
	-d \
	-p $lanIP:2525:25 \
	--restart always \
	--name postfix \
	quay.io/lavab/postfix
