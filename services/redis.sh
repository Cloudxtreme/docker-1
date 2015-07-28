# Not really safe to use in production
lanIP=$(/sbin/ifconfig eth1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}')
docker run \
	-d \
	-p $lanIP:6379:6379 \
	--name redis \
	--restart always \
	redis
