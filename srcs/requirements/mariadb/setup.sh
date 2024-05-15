sudo apt update && apt upgrade
apt install mariadb-server

# look at: https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-20-04
sudo systemctl start mariadb.service
sudp systemctl enable mariadb.service
sudo mysql_secure_installation

# run secure installation
sudo mysql_secure_installation

# check if everything is fine with mariah
sudo systemctl status mariadb

# Creating an Administrative User that Employs Password Authentication
sudo mariadb
# GRANT ALL ON *.* TO '<ADMIN>'@'localhost' IDENTIFIED BY '<PASSWORD>' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# EXIT;
