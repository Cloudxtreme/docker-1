lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
lookupdIP=$lanIP	# change when lookupd is running on a different machine
docker run \
	-d \
	-p $lanIP:4171:4171 \
	--name nsqadmin \
	nsqio/nsq \
	/nsqadmin \
	--lookupd-http-address=$lookupdIP:4161
