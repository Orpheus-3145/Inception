FROM debian:bullseye

EXPOSE 443
EXPOSE 3306

RUN apt update && \
apt upgrade -y && \
apt install nginx -y && \
apt install openssl -y

RUN mkdir -p /var/www/fra/html

RUN mkdir -p $HOME/data/wordpress

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/fra.key -out /etc/nginx/ssl/fra.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=42/OU=Codam/CN=localhost"

COPY default.conf /etc/nginx/inception.conf

COPY website/index.html /var/www/fra/html

CMD ["nginx", "-c", "/etc/nginx/inception.conf"]