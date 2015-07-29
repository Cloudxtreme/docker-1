DEBIAN_FRONTEND=noninteractive
lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
docker run \
	-d \
	-p $lanIP:13000:5000 \
	--restart always \
	--name ritratt \
	quay.io/lavab/ritratt
