FROM debian:bullseye

EXPOSE 9000
EXPOSE 3306

ARG DOMAIN_NAME
ARG DB_NAME
ARG WP_USER
ARG WP_PWD
ARG WP_PORT
ARG DB_PORT
ARG WP_ADMIN_USER
ARG WP_ADMIN_PWD
ARG WP_ADMIN_EMAIL
ARG DB_HOST

ENV DOMAIN_NAME=$DOMAIN_NAME
ENV DB_NAME=$DB_NAME
ENV WP_USER=$WP_USER
ENV WP_PWD=$WP_PWD
ENV WP_PORT=$WP_PORT
ENV DB_PORT=$DB_PORT
ENV WP_ADMIN_USER=$WP_ADMIN_USER
ENV WP_ADMIN_PWD=$WP_ADMIN_PWD
ENV WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL
ENV DB_HOST=$DB_HOST

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
    wget \
    nano

COPY www.conf /etc/php/7.4/fpm/pool.d/

# COPY wp-config-inception.php /var/www/html/wp-config.php

COPY setup_wp.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_wp.sh

# RUN /usr/sbin/setup_wp.sh

# Download the WP-CLI tool
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Make the WP-CLI tool executable
RUN chmod +x wp-cli.phar
# Move the WP-CLI tool to a directory in the PATH
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

RUN mkdir -p /run/php

# ENTRYPOINT [ "/usr/sbin/setup_wp" ]

# CMD ["/usr/sbin/php-fpm7.4", "-F"]

ENTRYPOINT [ "/bin/bash" ]