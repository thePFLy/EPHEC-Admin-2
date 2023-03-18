FROM ubuntu/bind9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bind9 \
        bind9utils \
        bind9-doc \
        dnsutils \
        wget

<<<<<<< HEAD
RUN wget --user=ftp --password=ftp ftp://ftp.rs.internic.net/domain/db.cache -O /etc/bind/db.root
COPY named.conf /etc/bind/named.conf
COPY db.woodytoys.lab /etc/bind/db.woodytoys.lab

# Change working directory to /var/cache/bind
WORKDIR /var/cache/bind

# Set permissions for /var/cache/bind
RUN chmod -R 777 /var/cache/bind
=======
COPY named.conf /etc/bind/
COPY woodytoys.intern /etc/bind/
COPY named.conf.local /etc/bind
COPY 10.168.192.in-addr.arpa /etc/bind
>>>>>>> main

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-g"]

