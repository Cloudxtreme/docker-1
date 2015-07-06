# Not really safe to use in production

docker run \
	-d \
	-p $(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'):6379:6379 \
	--name redis \
	redis
