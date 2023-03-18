FROM ubuntu/bind9

RUN apt-get update && apt-get upgrade -y && apt install bind9 bind9utils -y

COPY named.conf /etc/bind/
COPY woodytoys.intern /etc/bind/
COPY named.conf.local /etc/bind
COPY 10.168.192.in-addr.arpa /etc/bind

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-g"]

