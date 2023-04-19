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

# nouveaux utilisateurs
COPY users/newuser.sh /usr/local/bin
COPY users/user.txt /

# ajout droits utilisateurs 
RUN chmod +x /usr/local/bin/newuser.sh

RUN mkdir -p /var/spool/postfix/private && chown postfix:postfix /var/spool/postfix/private
RUN chmod 710 /var/spool/postfix/private && \
    groupadd -g 5000 vmail && \
    useradd -u 5000 -g vmail -d /home/vmail -m vmail && \
    chown -R vmail:vmail /var/mail

# on lance le script 
RUN newuser.sh

# Ports "utilisés"
EXPOSE 25 110 143 995 587

# Lancement de postfix et dovecot
CMD /usr/sbin/postfix start && /usr/sbin/dovecot -F
