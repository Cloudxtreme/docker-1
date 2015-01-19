# RethinkDB runner
# Author: Andrei Simionescu <andrei@lavaboom.com>
# This runs a RethinkDB container. It needs a REAL_IP env variable to run.
# Optionally you can specify where to store the data (RETHINKDB_DATA_DIR)
# and to join an existing cluster (RETHINKDB_JOIN_IP)  

DEBIAN_FRONTEND=noninteractive

# Setting a default for the data dir location
if [ -z "$RETHINKDB_DATA_DIR" ]; then
	RETHINKDB_DATA_DIR='/data/rethinkdb'
fi

# Is this the first host of the cluster or are we joining an existing cluster?
#if [ -z "$RETHINKDB_JOIN_IP" ]; then
#	RETHINKDB_JOIN_CMD='&& :'
#	RETHINKDB_JOIN_IP='<none>'
#else
#	RETHINKDB_JOIN_CMD="--join $RETHINKDB_JOIN_IP"
#fi

# RethinkDB needs the real IP to run
if [ -z "$REAL_IP" ]; then
	echo 'Please set the REAL_IP env var first.'
	echo "Your IPv4 seems to be: $(curl -s -4 icanhazip.com) Bye..."
else
	echo "Running dockerfile/rethinkdb on host $REAL_IP, joining host $RETHINKDB_JOIN_IP"
	docker run \
		--name rethinkdb \
		-d \
		-p 127.0.0.1:8080:8080 \
		-p 28015:28015 \
		-p 29015:29015 \
		-v /data/rethinkdb:/data \
		dockerfile/rethinkdb \
		rethinkdb \
			--bind all \
			--canonical-address $REAL_IP \
			--machine-name `hostname | sed 's/-/_/g'` #\
#			$RETHINKDB_JOIN_CMD
fi
