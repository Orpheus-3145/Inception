#!/bin/bash

if [ ! -e /etc/php/7.4/.php_done ]; then
    cd /var/www/html
    # wget https://wordpress.org/latest.tar.gz
    # tar -xzf latest.tar.gz
    # mv wordpress/* .
    # rm -f latest.tar.gz
    # rmdir wordpress
    chown -R www-data:www-data /var/www/html
	
    # Download the WordPress core files
	wp core download --allow-root
	# Create the WordPress configuration file with the provided database credentials and host
	wp config create --allow-root --dbname=$DB_NAME --dbuser=$WP_USER --dbpass=$WP_PWD --dbhost=$DB_HOST
	# Install WordPress with the provided site information and admin credentials
	wp core install --allow-root --url=$DOMAIN_NAME --title="inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
	# Create a new WordPress user with the provided credentials and role
	# wp user create --allow-root $WP_NORMAL_USER $WP_NORMAL_USER_EMAIL --user_pass=$WP_NORMAL_USER_PASSWORD --role=author

    # mv /etc/php/www.conf /etc/php/7.4/fpm/pool.d/www.conf           # unsure how to avoid writing full abs path
    touch /etc/php/7.4/.php_done
fi
