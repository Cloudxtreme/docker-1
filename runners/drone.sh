docker run -d \
	-e DRONE_GITHUB_CLIENT="1b6db93acc21d085791b" \
	-e DRONE_GITHUB_SECRET="47e80849b738247877380dc9e39de1e73c0d0743" \
	-e DRONE_GITHUB_ORGS="lavab" \
	-p 127.0.0.1:8222:80 \
	-v /opt/drone:/var/lib/drone \
	--privileged \
	--name drone \
	mattgruter/drone
