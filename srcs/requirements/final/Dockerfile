FROM debian:bullseye

EXPOSE 443
EXPOSE 9000
EXPOSE 3306

RUN apt update && \
apt upgrade -y && \
apt install -y mariadb-server \
mariadb-client \
php-cgi \
php-common \
php-fpm \
php-pear \
php-mbstring \
php-zip \
php-net-socket \
php-gd \
php-xml-util \
# php-gettext \
php-mysql \
php-bcmath \
wget \
nginx \
openssl

COPY setup.sh /usr/sbin/

COPY run.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup.sh

RUN chmod 744 /usr/sbin/run.sh

# mariadb    
RUN mkdir -p /var/run/mysqld

RUN mkdir -p $HOME/data/mariadb

VOLUME ["$HOME/data/mariadb"]

RUN chown -R mysql:mysql /var/run/mysqld

# nginx
ENV DOMAIN_NAME "faru.42.fr"

RUN mkdir -p /var/www/html

RUN mkdir -p $HOME/data/wordpress

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/$DOMAIN_NAME.key -out /etc/nginx/ssl/$DOMAIN_NAME.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=42/OU=Codam/CN=localhost"

COPY default.conf /etc/nginx/inception.conf

# wordpress ang php
COPY php.ini /etc/php/

COPY wp-config-inception.php /var/www/html/wp-config.php

RUN mkdir -p $HOME/data/wordpress

RUN /usr/sbin/setup.sh

# CMD ["/usr/sbin/php-fpm7.4", "-F"]

VOLUME ["$HOME/data/wordpress"]

ENTRYPOINT ["/usr/sbin/run.sh"]

CMD ["/bin/bash"]