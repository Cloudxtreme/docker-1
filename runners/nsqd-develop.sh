docker run \
	-d \
	-p $(/sbin/ifconfig tun0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4150:4150 \
	-p $(/sbin/ifconfig tun0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4151:4151 \
	--name nsqd \
	nsqio/nsq \
	/nsqd \
	--broadcast-address=$(/sbin/ifconfig tun0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}') \
	--lookupd-tcp-address=10.8.0.3:4160