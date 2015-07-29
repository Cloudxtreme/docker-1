docker run \
	-d \
	-e SETTINGS_FLAVOR=local \
	-e STORAGE_PATH=/registry \
	-p 127.0.0.1:18000:5000 \
	-v /data/registry:/registry \
	--name registry \
	registry
