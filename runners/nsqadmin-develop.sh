docker run \
	-d \
	-p $(/sbin/ifconfig tun0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4171:4171 \
	--name nsqadmin \
	nsqio/nsq \
	/nsqadmin \
	--lookupd-http-address=10.8.0.3:4161