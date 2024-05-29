# sudo apt update && apt upgrade
# apt install mariadb-server -y

# # look at: https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04
# sudo systemctl start mariadb.service
# sudo systemctl enable mariadb.service

# # run secure installation
# sudo mysql_secure_installation

# # check if everything is fine with mariah
# sudo systemctl status mariadb

# # Creating an Administrative User that Employs Password Authentication, probabily not needed
# #sudo mariadb
# #GRANT ALL ON *.* TO '<ADMIN>'@'localhost' IDENTIFIED BY '<PASSWORD>' WITH GRANT OPTION;
# #FLUSH PRIVILEGES;
# #EXIT;

#!/bin/bash
# is_running=`service mariadb status | grep "Active: active (running)" | wc -l`

# echo "is running: " $is_running

if [ `service mariadb status` -eq "MariaDB is stopped.." ]; then
    service mariadb start
fi

/usr/sbin/mariadbd