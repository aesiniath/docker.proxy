#!/bin/bash -xe

#
# When we run with the ./start.sh script we mount a Docker provided volume
# named 'repository-package-cache'. That's fine, but like all things Docker
# it's a bit ephemeral. To guard against accidentally nuking the entire
# downloaded Linux package cache when cleaning up docker's mess, copy the Nginx
# proxy cache tree out periodcally with this script.
#

sudo rsync -avP "$@" \
	/var/lib/docker/volumes/repository-package-cache/_data/ \
	/srv/backup/nginx-proxy-cache
