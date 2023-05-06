FROM ubuntu/bind9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bind9 \
        bind9utils \
        bind9-doc \
        dnsutils \
        wget

RUN wget --user=ftp --password=ftp ftp://ftp.rs.internic.net/domain/db.cache -O /etc/bind/db.root
COPY conf/named.conf /etc/bind/named.conf
COPY conf/db.woodytoys.lab /etc/bind/db.woodytoys.lab
COPY conf/db.20.168.192 /etc/bind/db.20.168.192

WORKDIR /var/cache/bind

RUN chown bind:bind /etc/bind/* && \
    chmod 644 /etc/bind/*

RUN chown bind:bind /var/cache/bind && \
    chmod 755 /var/cache/bind

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-g"]

