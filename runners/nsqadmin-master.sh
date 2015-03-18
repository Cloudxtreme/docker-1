docker run \
	-d \
	-p $(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4171:4171 \
	--name nsqadmin \
	nsqio/nsq \
	/nsqadmin \
	--lookupd-http-address=172.16.0.1:4161