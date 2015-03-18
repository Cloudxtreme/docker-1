docker run \
	-d \
	-p $(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):783:783 \
	--name spamd \
	registry.lavaboom.io/lavaboom/spamd