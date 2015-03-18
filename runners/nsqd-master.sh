docker run \
	-d \
	-p $(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4150:4150 \
	-p $(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4151:4151 \
	--name nsqd \
	nsqio/nsq \
	/nsqd \
	--broadcast-address=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}') \
	--lookupd-tcp-address=172.16.0.1:4160