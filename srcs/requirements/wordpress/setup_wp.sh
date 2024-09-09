#!/bin/bash

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm -f latest.tar.gz
chown -R www-data:www-data /var/www/html

# ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

# service php7.4-fpm stop
mv /etc/php/php.ini /etc/php/7.4/fpm/php.ini                    # unsure how to avoid writing full abs path
mv /etc/php/www.conf /etc/php/7.4/fpm/pool.d/www.conf           # unsure how to avoid writing full abs path
# service php7.4-fpm start      # so new php.ini is used
