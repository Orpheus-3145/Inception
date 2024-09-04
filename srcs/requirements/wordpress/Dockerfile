FROM debian:bullseye

EXPOSE 443
EXPOSE 3306

RUN apt update && \
    apt upgrade -y && \
    # apt install mariadb-server -y \
    apt install mariadb-client -y && \
    apt install php-cgi -y && \
    apt install php-common -y && \
    apt install php-fpm -y && \
    apt install php-pear -y && \
    apt install php-mbstring -y && \
    apt install php-zip -y && \
    apt install php-net-socket -y && \
    apt install php-gd -y && \
    apt install php-xml-util -y && \
    apt install php-gettext -y && \
    apt install php-mysql -y && \
    apt install php-bcmath -y && \
    apt install unzip -y && \
    apt install wget -y && \
    apt install git -y
    # apt install nginx -y && \
    # apt install openssl -y

# mariadb    
# RUN mkdir -p /var/run/mysqld

# RUN mkdir -p $HOME/data/mariadb

# RUN chown -R mysql:mysql /var/run/mysqld

# COPY setup_maria.sh /usr/sbin/

# RUN chmod 744 /usr/sbin/setup_maria.sh

# RUN /usr/sbin/setup_wp.sh

# VOLUME ["/root/data/mariadb"]

# RUN "mysqld"

#nginx
# ENV DOMAIN_NAME "faru.42.fr"

# RUN mkdir -p /var/www/$DOMAIN_NAME/html

# RUN mkdir -p $HOME/data/wordpress

# RUN mkdir -p /etc/nginx/ssl

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/$DOMAIN_NAME.key -out /etc/nginx/ssl/$DOMAIN_NAME.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=42/OU=Codam/CN=localhost"

# COPY default.conf /etc/nginx/inception.conf

# COPY website/index.html /var/www/$DOMAIN_NAME/html

#wordpress
COPY setup_wp.sh /usr/sbin/

RUN chmod 744 /usr/sbin/setup_wp.sh

ENTRYPOINT "/bin/bash