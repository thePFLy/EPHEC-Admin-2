FROM ubuntu:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y postfix dovecot-core dovecot-imapd dovecot-pop3d && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY postfix/main.cf /etc/postfix/main.cf
COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf

EXPOSE 25 143 993

CMD ["sh", "-c", "service postfix start && service dovecot start && tail -f /var/log/mail.log"]
