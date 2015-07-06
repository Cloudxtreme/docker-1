DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 127.0.0.1:13000:5000 \
	--restart always \
	--name ritratt \
	lavab/ritratt
