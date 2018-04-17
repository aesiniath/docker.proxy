docker run \
	--name="proxy" \
	--interactive=true \
	--tty=true \
	--rm=true \
	--volume=repository-package-cache:/var/cache/nginx:Z \
	localhost/afcowie/proxy:latest
