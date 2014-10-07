# Lavaboom API
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Launches the API on port 5000

DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 5000:80 \
	--name api \
	lavab/api
