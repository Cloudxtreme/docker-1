# Not really safe to use in production

docker run \
	-d \
	-p $(/sbin/ifconfig tun0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):4222:4222 \
	-p $(/sbin/ifconfig tun0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):8333:8333 \
	--name nats \
	apcera/gnatsd
