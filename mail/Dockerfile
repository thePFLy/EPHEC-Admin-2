FROM ubuntu:latest
# installation des dépendances postfix & dovecot
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y postfix postfix-mysql dovecot-lmtpd telnet dovecot-mysql dovecot-core dovecot-imapd dovecot-pop3d mysql-server mysql-client&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    touch /var/log/mail.log
    
# config fichiers postfix
COPY postfix/main.cf /etc/postfix/main.cf
COPY postfix/master.cf /etc/postfix/master.cf
COPY postfix/mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf
COPY postfix/mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf
COPY postfix/mysql-virtual-alias-maps.cf /etc/postfix/mysql-virtual-alias-maps.cf


# config db
COPY db-mail/createdb-mail.sql config-sql/createdb-mail.sql
COPY db-mail/createusers-mail.sql config-sql/createusers-mail.sql


# config fichiers dovecots
COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY dovecot/dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext

COPY dovecot/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY dovecot/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY dovecot/10-master.conf /etc/dovecot/conf.d/10-master.conf

COPY dovecot/auth-sql.conf.ext /etc/dovecot/conf.d/auth-sql.conf.ext
COPY dovecot/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf

# Create folder for each domain registered in MySQL table
RUN mkdir -p /var/mail/vhosts/woodytoys.lab

# Create vmail user and group with uid and gid of 5000
RUN groupadd -g 5000 vmail && \
    useradd -g vmail -u 5000 vmail -d /var/mail

# Change owner of /var/mail folder to vmail user
RUN chown -R vmail:vmail /var/mail

RUN chown -R vmail:dovecot /etc/dovecot \
    && chmod -R o-rwx /etc/dovecot

RUN usermod -d /var/lib/mysql/ mysql

EXPOSE 25 143 465 587 993


CMD ["sh", "-c", "service mysql start; mysql -u root < config-sql/createdb-mail.sql; mysql -u root < config-sql/createusers-mail.sql; service postfix start; service dovecot start; tail -F /var/log/mail.log"]

