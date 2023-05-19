FROM ubuntu/bind9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bind9 \
        bind9utils \
        bind9-doc \
        dnsutils \
        wget

RUN wget --user=ftp --password=ftp ftp://ftp.rs.internic.net/domain/db.cache -O /etc/bind/db.root
COPY named.conf /etc/bind/named.conf
COPY named.conf.log /etc/bind/named.conf.log
COPY db.l2-4.ephec-ti.be /etc/bind/db.l2-4.ephec-ti.be

WORKDIR /var/cache/bind

RUN chown bind:bind /etc/bind/* && \
    chmod 644 /etc/bind/*

RUN chown bind:bind /var/cache/bind && \
    chmod 755 /var/cache/bind


EXPOSE  5300/udp
EXPOSE  5300/tcp

CMD ["named", "-g"]
