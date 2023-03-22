FROM ubuntu:latest
# installation des dépendances postfix & dovecot
RUN apt update && \
    apt install -y --no-install-recommends \
        net-tools\
        dovecot-core \
        dovecot-imapd \
        dovecot-pop3d \
        postfix
    
# config fichiers postfix
COPY postfix/main.cf /etc/postfix/main.cf

# config fichiers dovecots
COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf

# utilisateurs
COPY users/createuser.sh /usr/local/bin
COPY users/user.txt /

RUN chmod +x /usr/local/bin/createuser.sh

RUN mkdir -p /var/spool/postfix/private && \
    chown postfix:postfix /var/spool/postfix/private && \
    chmod 710 /var/spool/postfix/private && \
    groupadd -g 5000 vmail && \
    useradd -u 5000 -g vmail -d /home/vmail -m vmail && \
    chown -R vmail:vmail /var/mail

RUN createuser.sh

EXPOSE 25 110 143 995 587

CMD /usr/sbin/postfix start && /usr/sbin/dovecot -F
