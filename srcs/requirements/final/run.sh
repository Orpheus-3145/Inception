#!/bin/bash
service mariadb start
nginx -c /etc/nginx/inception.conf
service php7.4-fpm start      # so new php.ini is used

exec $@