FROM debian:bullseye

EXPOSE 9000
EXPOSE 3306

ARG DOMAIN_NAME
ENV DOMAIN_NAME=$DOMAIN_NAME

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
    wget \
    netcat

RUN mkdir -p /var/www/html/$DOMAIN_NAME

RUN mkdir -p /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY setup/setup_wp.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_wp.sh

ENTRYPOINT [ "/usr/sbin/setup_wp.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "-F"]
    