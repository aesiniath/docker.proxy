docker run \
	--interactive=true \
	--tty=true \
	--rm=true \
	--volume=repository-package-cache:/var/cache/nginx:z \
	localhost/afcowie/proxy:latest
