lanIP=$(/sbin/ifconfig docker0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
docker run \
	-d \
	-p $lanIP:783:783 \
	--restart always \
	--name spamd \
	quay.io/lavab/spamd
