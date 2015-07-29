DEBIAN_FRONTEND=noninteractive
docker run \
	-d \
	--restart always \
	--name slackbridge \
	quay.io/lavab/slackbridge
