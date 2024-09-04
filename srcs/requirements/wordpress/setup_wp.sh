
if [ ! -e "/var/run/mysqld/.var_setup_done" ]; then
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WP_DB;"
    mysql -u root -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD';"
    mysql -u root -e "GRANT ALL ON $WP_DB.* TO '$WP_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
fi