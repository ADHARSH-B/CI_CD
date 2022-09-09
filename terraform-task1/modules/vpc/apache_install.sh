#!/bin/bash
sudo apt -y update
sudo apt -y install apache2
sudo apt -y install php-mysql
sudo apt -y install php
sudo apt -y install mysql-server
sudo systemctl start apache2
sudo mv /home/ubuntu/mysql-connection.php /var/www/html/mysql-connection.php