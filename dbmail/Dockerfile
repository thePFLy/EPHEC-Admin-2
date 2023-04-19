FROM ubuntu:latest

RUN apt-get update && apt-get install -y mysql-server mysql-client

RUN service mysql start && \
    mysql -u root -proot -e "CREATE DATABASE servermail;" && \
    sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf &&\
    service mysql restart

COPY init.sql /docker-entrypoint-initdb.d/

RUN service mysql restart && \
    mysql -u root -proot servermail < /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306

CMD ["mysqld"]
