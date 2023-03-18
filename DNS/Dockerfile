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

# Change working directory to /var/cache/bind
WORKDIR /var/cache/bind

# Set permissions for /var/cache/bind
RUN chmod -R 777 /var/cache/bind

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-g"]

