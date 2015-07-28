lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
broadcastIP=$lanIP
docker run \
	-d \
	-p $lanIP:4160:4160 \
	-p $lanIP:4161:4161 \
	--name nsqlookupd \
	nsqio/nsq \
	/nsqlookupd \
	--broadcast-address=$broadcastIP
