FROM ubuntu:latest
# installation des dépendances postfix & dovecot
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y postfix postfix-mysql dovecot-core dovecot-imapd dovecot-pop3d spamassassin spamc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# config fichiers postfix
COPY postfix/main.cf /etc/postfix/main.cf
COPY postfix/master.cf /etc/postfix/master.cf
COPY postfix/mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf 
COPY postfix/mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf 
COPY postfix/mysql-virtual-alias-maps.cf /etc/mysql/mysql-virtual-alias-maps.cf
COPy postfix/mysql-virtual-email2email.cf /etc/postfix/mysql-virtual-email2email.cf
# config fichiers dovecots
COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY dovecot/dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf
# config anti-spam
RUN apt-get install -y spamassassin spamc
COPY spamassassin/local.cf /etc/spamassassin/local.cf
# ports utiisés (SMTP SSL IMAP POP3)
EXPOSE 25 143 465 587 993

CMD ["sh", "-c", "service postfix start && service dovecot start && service spamassassin start && tail -f /var/log/mail.log"]
