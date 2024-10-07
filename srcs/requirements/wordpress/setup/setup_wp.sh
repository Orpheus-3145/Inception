#!/bin/bash

if [ ! -e /var/www/html/$DOMAIN_NAME/.wordpress_setup_done ]; then	
	cd /var/www/html/$DOMAIN_NAME

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	chmod +x /usr/local/bin/wp

    chown -R www-data:www-data /var/www/html/$DOMAIN_NAME

	sleep 10
	until nc -z $DB_HOST $DB_PORT; do echo 'Waiting db...' >>output && sleep 5; done
    # Download the WordPress core files
	wp core download --allow-root

	# Create the WordPress configuration file with the provided database credentials and host
	wp config create	--allow-root \
						--dbname="$DB_NAME" \
						--dbuser="$WP_USER" \
						--dbpass="$WP_USER_PWD" \
						--dbhost="$DB_HOST:$DB_PORT"
	
	# Install WordPress with the provided site information and admin credentials
	wp core install	--allow-root \
					--url="https://$DOMAIN_NAME/" \
					--title="inception" \
					--admin_user="$WP_ADMIN" \
					--admin_password="$WP_ADMIN_PWD" \
					--admin_email="$WP_ADMIN_EMAIL" \
					--skip-email

	# Create a new WordPress user with the provided credentials and role
	wp user create	"$WP_USER" "$WP_USER_EMAIL" \
					--allow-root  \
					--user_pass="$WP_USER_PWD" \
					--role=author

    touch .wordpress_setup_done
fi

exec "$@"
