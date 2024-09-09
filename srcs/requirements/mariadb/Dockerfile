FROM debian:bullseye

EXPOSE 3306

ARG DOMAIN_NAME
ARG WP_DB
ARG WP_USER
ARG WP_PWD
ARG DB_PORT

ENV DOMAIN_NAME=$DOMAIN_NAME
ENV WP_DB=$WP_DB
ENV WP_USER=$WP_USER
ENV WP_PWD=$WP_PWD
ENV DB_PORT=$DB_PORT

RUN mkdir -p /run/mysqld

RUN mkdir -p $HOME/data/mariadb

RUN apt update && \
apt upgrade -y && \
apt install mariadb-server -y

RUN chown -R mysql:mysql /run/mysqld

COPY setup_maria.sh /usr/sbin/

COPY inception.cnf /etc/mysql/conf.d/   

RUN chmod 744 /usr/sbin/setup_maria.sh

RUN /usr/sbin/setup_maria.sh

ENTRYPOINT ["mysqld"]