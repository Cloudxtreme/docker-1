# Lavaboom API
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Launches the API on port 5000

DEBIAN_FRONTEND=noninteractive

docker run \
	-d \
	-p 5000:5000 \
	-e "RETHINKDB_AUTHKEY=d0llad0llabilly4ll_rethinkdb" \
	-e "API_HOST=api.lavaboom.io" \
	--link rethinkdb:rethinkdb \
	--name api \
	andreis/api
