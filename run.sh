#!/bin/sh -xe

podman run \
	--name="packages" \
	--rm=true \
	--publish=1999:1999 \
	--volume=repository-package-cache:/var/cache/nginx:Z \
	aesiniath/proxy:latest
