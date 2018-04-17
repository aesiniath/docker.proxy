FROM localhost/afcowie/debian:stretch

# base image sets non-interactive and locale

RUN apt-get update
RUN apt-get install nginx

# copy in nginx configuration files. We do our work in proxy.conf in
# /etc/nginx/conf.d/ but have to remove the default server otherwise it will
# consume port 80 connections.

RUN rm /etc/nginx/sites-enabled/default
COPY files/. /

EXPOSE 80

CMD ["-g daemon off;"]

ENTRYPOINT ["/usr/sbin/nginx"]

