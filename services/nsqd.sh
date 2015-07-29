lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
broadcastIP=$lanIP
lookupdIP=$lanIP
docker run \
	-d \
	-p $lanIP:4150:4150 \
	-p $lanIP:4151:4151 \
	--name nsqd \
	--restart always\
	nsqio/nsq \
	/nsqd \
	--broadcast-address=$broadcastIP \
	--lookupd-tcp-address=$lookupdIP:4160
