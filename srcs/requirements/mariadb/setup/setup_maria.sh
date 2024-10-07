#!/bin/bash

if [[ `service mariadb status | wc -l` == 1 ]]; then
    service mariadb start

    if [[ $? != 0 ]]; then
        echo "error while starting mariadb"
        exit 1
    fi

    sleep 5
fi

if [ ! -e "/var/lib/mysql/.mysql_setup_done" ]; then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -u root -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PWD';"
    mysql -u root -e "GRANT ALL ON $DB_NAME.* TO '$WP_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    touch /var/lib/mysql/.mysql_setup_done
fi

service mariadb stop

exec "$@"
