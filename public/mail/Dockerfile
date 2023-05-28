FROM ubuntu:latest
# installation des dépendances postfix & dovecot
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive\
    apt install -y --no-install-recommends \
        postfix\
        dovecot-core \
        dovecot-imapd \
        dovecot-pop3d \
        openssl\
        ca-certificates\
        net-tools\
        spamassassin\
        opendkim\
        opendkim-tools\
        postfix-policyd-spf-python\
        opendmarc\
        spamc


VOLUME ["/ssl_private", "/ssl_certs"]

# dkim
RUN gpasswd -a postfix opendkim
RUN mkdir -p /etc/opendkim/
RUN mv /etc/opendkim.conf /etc/opendkim/
RUN ln -s /etc/opendkim/opendkim.conf /etc/opendkim.conf

#RUN openssl genrsa -out /etc/opendkim/opendkim.key 1024
#RUN openssl rsa -in /etc/opendkim/opendkim.key -pubout -out /etc/opendkim/opendkim.pub.key
COPY /opendkim/opendkim.key /etc/opendkim/opendkim.key
COPY /opendkim/opendkim.pub.key /etc/opendkim/opendkim.pub.key
RUN chmod "u=rw,o=,g=" /etc/opendkim/opendkim.key
RUN chown opendkim:opendkim /etc/opendkim/opendkim.key

COPY /opendkim/opendkim.conf /etc/opendkim/opendkim.conf

COPY /opendkim/SigningTable /etc/opendkim/SigningTable
COPY /opendkim/TrustedHosts /etc/opendkim/TrustedHosts
COPY /opendkim/KeyTable /etc/opendkim/KeyTable

#dmarc
COPY /opendmarc/opendmarc.conf /etc/opendmarc.conf

# spf
COPY /spf/policyd-spf.conf /etc/postfix-policyd-spf-python/policyd-spf.conf

# ssl script
COPY ssl/init_ssl.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init_ssl.sh

# config fichiers postfix
COPY postfix/main.cf /etc/postfix/main.cf

# config fichiers dovecots
COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf

# spamassassin
COPY spamassassin/local.cf /etc/spamassassin/local.cf
COPY spamassassin/spamassassin /etc/default/spamassassin
RUN adduser spamd --disabled-login

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
EXPOSE 25 110 143 465 783 995 587

# Lancement de postfix et dovecot
# CMD /usr/sbin/postfix start && /usr/sbin/dovecot -F
CMD ["/bin/bash", "-c", "/usr/local/bin/init_ssl.sh && /usr/sbin/postfix start && /usr/sbin/dovecot -F && /usr/sbin/spamassassin start"]
