#!/bin/bash

if [[ `service mariadb status | wc -l` == 1 ]]; then
    service mariadb start

    if [[ $? != 0 ]]; then
        echo "error while starting mariadb"
        exit 1
    fi
    if [ ! -e "/var/run/mysqld/.mysql_setup_done" ]; then
        mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
        mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
        mysql -u root -e "GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';"
        mysql -u root -e "FLUSH PRIVILEGES;"
        mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"

        touch /var/run/mysqld/.mysql_setup_done
    fi

    service mariadb stop
fi

exec $@