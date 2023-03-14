FROM ubuntu:latest

# dépendances
RUN apt-get update && \
    apt-get install -y bind9 postfix dovecot-core dovecot-imapd dovecot-pop3d && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# config DNS 
COPY dns/named.conf.local /etc/bind/named.conf.local
COPY dns/db.local /etc/bind/db.local
COPY dns/db.tmp.example.be /etc/bind/db.tmp.ex.be

# serv web example
# COPY web/nginx.conf /etc/nginx/nginx.conf
# COPY web/index.html /var/www/html/index.html
# COPY web/db_config.php /var/www/html/db_config.php

# Copy mail server configuration files
COPY mail/main.cf /etc/postfix/main.cf
COPY mail/master.cf /etc/postfix/master.cf
COPY mail/dovecot.conf /etc/dovecot/dovecot.conf
# COPY mail/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
# COPY mail/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
# COPY mail/10-master.conf /etc/dovecot/conf.d/10-master.conf
# COPY mail/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf

# ports dns, mail, web interne
EXPOSE 53/tcp 53/udp
EXPOSE 80/tcp
EXPOSE 110/tcp 143/tcp 993/tcp 995/tcp

# démmarage services
CMD service bind9 start && \
    service nginx start && \
    service postfix start && \
    service dovecot start && \
    # garder le conteneur en cours d'exec
    tail -f /dev/null
