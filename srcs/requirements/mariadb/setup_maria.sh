#!/bin/bash

if [[ `service mariadb status | wc -l` == 1 ]]; then
    # /usr/sbin/mysqld --skip-networking
    # /etc/init.d/mariadb start
    service mariadb start
fi

if [[ $? != 0 ]]; then
    echo "error while starting mariadb"
    exit 1
fi

# until [ -S /run/mysqld/mysqld.sock ]; do
#     sleep 1
# done

if [ ! -e "/etc/mysql/.mysql_setup_done" ]; then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -u root -e "CREATE USER '$WP_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$WP_PWD';"
    mysql -u root -e "GRANT ALL ON $DB_NAME.* TO '$WP_USER'@'$DOMAIN_NAME';"
	mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PWD');"
    mysql -u root -e "FLUSH PRIVILEGES;"

    touch /etc/mysql/.mysql_setup_done
fi
# /etc/init.d/mariadb stop
# mysqladmin -u root -p shutdown
# service mariadb stop

# exec $@