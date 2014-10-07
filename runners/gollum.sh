# Gollum (lavab/gollum)
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Gollum is a dumb wiki written in Ruby and used on Github
# However, it's the best/simplest option available without a database
#   GOLLUM_PORT [4040]: the container servers HTTP over this port
#   GOLLUM_DATA [/data/gollum]: the Gollum data (a git repository)
 
DEBIAN_FRONTEND=noninteractive

if [ -z "$GOLLUM_PORT" ]; then
	GOLLUM_PORT=4040
fi

if [ -z "$GOLLUM_DATA" ]; then
	GOLLUM_DATA='/data/gollum'
fi

echo "Running Gollum on port $GOLLUM_PORT with data directory $GOLLUM_DATA ..."
docker run \
	-d \
	-p $GOLLUM_PORT:4567 \
	--name gollum \
	-v $GOLLUM_DATA:/root/wikidata \
	suttang/gollum --allow-uploads --live-preview
