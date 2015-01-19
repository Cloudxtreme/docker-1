# Ghost (lavab/ghost)
# Author: Andrei Simionescu <andrei@lavaboom.com>
# Ghost, "the simple blogging platform", is a Node.js blogging system
# The lavab/ghost image adds an MTA to dockerfile/ghost, on which it's based.
#   GHOST_PORT [4041]: the container will serve HTTP over this port
#   GHOST_DATA [/data/ghost]: the Ghost files (posts, themes, settings)

DEBIAN_FRONTEND=noninteractive

if [ -z "$GHOST_PORT" ]; then
	GHOST_PORT=4041
fi

if [ -z "$GHOST_DATA" ]; then
	GHOST_DATA='/data/ghost'
fi

echo "Running Ghost on port $GHOST_PORT and data directory $GHOST_DATA ..."
docker run \
	-d \
	-p 127.0.0.1:$GHOST_PORT:2368 \
	-v $GHOST_DATA:/ghost-override \
	--name ghost \
	lavab/ghost
