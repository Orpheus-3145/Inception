#!/bin/bash
export WP_DB="wp_db"
export WP_USER="wp_user"
export WP_PASSWORD="wp_pwd"
export MYSQL_DB="maria_db"
export MYSQL_USER="maria_user"
export MYSQL_PASSWORD="maria_pwd"

service mariadb start

if [[ $? != 0 ]]; then
    echo "error while starting mariadb"
    exit 1
fi

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'localhost';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WP_DB;"
mysql -u root -e "CREATE USER '$WP_USER'@'localhost' IDENTIFIED BY '$WP_PASSWORD';"
mysql -u root -e "GRANT ALL ON $WP_DB.* TO '$WP_USER'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# service mariadb stop

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm -f latest.tar.gz
mv wp-config.php wordpress/
chown -R www-data:www-data /var/www/html/wordpress

ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

service php7.4-fpm stop
mv /etc/php/php.ini /etc/php/7.4/fpm/php.ini        # unsure how to avoid writing full abs path
# service php7.4-fpm start      # so new php.ini is used
