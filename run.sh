#!/bin/sh -xe

podman network create proxy || true

podman run \
	--name="packages" \
	--rm=true \
	--volume=repository-package-cache:/var/cache/nginx:Z \
	--network="proxy" \
	oprdyn/proxy:latest
