FROM debian:bullseye

EXPOSE 3306

ARG DOMAIN_NAME
ARG DB_NAME
ARG WP_USER
ARG WP_PWD
ARG DB_PORT
ARG DB_ROOT_PWD

ENV DOMAIN_NAME=$DOMAIN_NAME
ENV DB_NAME=$DB_NAME
ENV WP_USER=$WP_USER
ENV WP_PWD=$WP_PWD
ENV DB_PORT=$DB_PORT
ENV DB_ROOT_PWD=$DB_ROOT_PWD

RUN mkdir -p /run/mysqld

RUN mkdir -p /var/lib/mysql

RUN apt update && \
apt upgrade -y && \
apt install mariadb-server -y

RUN chown -R mysql:mysql /run/mysqld

COPY inception.cnf /etc/mysql/conf.d/   

COPY setup_maria.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_maria.sh

RUN /usr/sbin/setup_maria.sh

ENTRYPOINT ["mysqld"]