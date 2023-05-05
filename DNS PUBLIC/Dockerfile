FROM ubuntu/bind9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bind9 \
        bind9utils \
        bind9-doc \
        dnsutils \
        wget

COPY named.conf /etc/bind/named.conf
COPY named.conf.log /etc/bind/named.conf.log
COPY db.l2-4.ephec-ti.be /etc/bind/db.l2-4.ephec-ti.be
COPY db.30.168.192 /etc/bind/db.20.168.192

WORKDIR /var/cache/bind

RUN chmod -R 777 /var/cache/bind

EXPOSE  53/udp
EXPOSE  53/tcp

CMD ["named", "-g"]
