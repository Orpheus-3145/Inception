FROM debian:bullseye

EXPOSE 443
EXPOSE 9000

RUN apt update && \
apt upgrade -y && \
apt install -y nginx openssl

RUN mkdir -p /var/www/html

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/ssl_cert.key -out /etc/nginx/ssl/ssl_cert.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=42/OU=Codam/CN=localhost"

COPY default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
