#!/bin/bash

if [ ! -e /etc/php/7.4/.php_done ]; then
    cd /var/www/html

    chown -R www-data:www-data /var/www/html	
    # Download the WordPress core files
	wp core download --allow-root
	# Create the WordPress configuration file with the provided database credentials and host
	# wp config create --allow-root --dbname=$DB_NAME --dbuser=$WP_USER --dbpass=$WP_PWD --dbhost=$DB_HOST:$DB_PORT
	# Install WordPress with the provided site information and admin credentials
	wp core install --allow-root --url=$DOMAIN_NAME --title="inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
	# Create a new WordPress user with the provided credentials and role
	wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_PWD --role=author

    touch /etc/php/7.4/.php_done
fi

exec "$@"
