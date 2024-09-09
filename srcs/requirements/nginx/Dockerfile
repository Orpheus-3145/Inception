FROM debian:bullseye

EXPOSE 443
EXPOSE 9000

RUN apt update && \
apt upgrade -y && \
apt install -y nginx openssl

ARG DOMAIN_NAME

ENV DOMAIN_NAME=$DOMAIN_NAME

RUN mkdir -p /var/www/$DOMAIN_NAME/html

RUN mkdir -p $HOME/data/wordpress

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/$DOMAIN_NAME.key -out /etc/nginx/ssl/$DOMAIN_NAME.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=42/OU=Codam/CN=localhost"

COPY default.conf /etc/nginx/inception.conf

CMD ["nginx", "-c", "/etc/nginx/inception.conf"]