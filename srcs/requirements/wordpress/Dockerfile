FROM debian:bullseye

EXPOSE 9000
EXPOSE 3306

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

COPY wp-config-inception.php /var/www/html/wp-config.php

COPY setup_wp.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_wp.sh

RUN /usr/sbin/setup_wp.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

RUN mkdir -p /run/php

ENTRYPOINT [ "/usr/sbin/setup_wp.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "-F"]
