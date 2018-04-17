FROM afcowie/fedora:27

RUN dnf install -y \
	squid 

ADD squid.conf /etc/squid/squid.conf

EXPOSE 3128

ENTRYPOINT ["/usr/sbin/squid", "--foreground"]
