FROM debian:bullseye

EXPOSE 9000
EXPOSE 3306

ARG DOMAIN_NAME
ARG WP_DB
ARG WP_USER
ARG WP_PWD
ARG WP_PORT
ARG DB_PORT

ENV DOMAIN_NAME=$DOMAIN_NAME
ENV WP_DB=$WP_DB
ENV WP_USER=$WP_USER
ENV WP_PWD=$WP_PWD
ENV WP_PORT=$WP_PORT
ENV DB_PORT=$DB_PORT

RUN apt update && \
    apt upgrade -y && \
    apt install -y mariadb-client \
    php-cgi \
    php-common \
    php-fpm \
    php-pear \
    php-mbstring \
    php-zip \
    php-net-socket \
    php-gd \
    php-xml-util \
    php-mysql \
    php-bcmath \
    unzip \
    wget

COPY php.ini /etc/php/

COPY wp-config-inception.php /var/www/html/wp-config.php

COPY setup_wp.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_wp.sh

RUN /usr/sbin/setup_wp.sh

RUN mkdir -p $HOME/data/wordpress

# ENTRYPOINT ["service", "php7.4-fpm", "start"]

ENTRYPOINT [ "/bin/bash" ]  