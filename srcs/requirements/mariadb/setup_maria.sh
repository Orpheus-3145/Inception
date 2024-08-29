#!/bin/bash
# look at: https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04

if [[`service mariadb status | wc -l` == 1]]
    echo "mariadb is not running"
    exit 1
fi

# run secure installation
mysql_secure_installation

# Creating an Administrative User that Employs Password Authentication, probabily not needed
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');"