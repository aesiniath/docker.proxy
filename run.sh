#!/bin/sh -xe

docker run \
	--name="packages" \
	--rm=true \
	--volume=repository-package-cache:/var/cache/nginx:Z \
	--network="proxy" \
	oprdyn/proxy:latest
