FROM docker.io/library/debian:stretch

# This clones the work in our standard in-house base image, but we want this
# container to be stand-alone (and more to the point, be the first thing
# running, so that base can be configured to use this as a package repository).

ENV DEBIAN_FRONTEND noninteractive

COPY files/etc/apt/. /etc/apt
COPY files/root/. /root

RUN apt-get update

# Put a locale in place which understands UTF8

RUN apt-get install apt-utils locales
RUN locale-gen C.UTF-8 && update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get upgrade

# now install Nginx

RUN apt-get install nginx

# copy in nginx configuration files. We do our work in proxy.conf in
# /etc/nginx/conf.d/ but have to remove the default server otherwise it will
# consume port 80 connections.

RUN rm /etc/nginx/sites-enabled/default
COPY files/etc/nginx/. /etc/nginx

EXPOSE 80

# run in foreground

ENTRYPOINT ["nginx", "-g", "daemon off;"]

