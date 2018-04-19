#!/bin/sh -xe

docker run \
	--name="proxy" \
	--rm=true \
	--volume=repository-package-cache:/var/cache/nginx:Z \
	localhost/afcowie/proxy:latest
