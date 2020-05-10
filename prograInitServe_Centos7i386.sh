#!/bin/bash

#actulisar servidor
echo "Actulisar servidor"
sleep 2
yum -y update
echo "10%"
sleep 2
#instalar ifconfig
echo "Instalar ifconfig"
sleep 2
yum -y install net-tools
echo "12%"
sleep 2
#instalar nano
echo "Instalar nano"
sleep 2
yum -y install nano
echo "13%"
sleep 2
#instalar apache
echo "Instalar apache"
sleep 2
yum -y install httpd
echo "15%"
sleep 2
#instalar epel wget y screen
echo "Intalar epel wget screen"
sleep 2
yum -y install epel-release wget screen
subscription-manager repos --enable rhel-7-server-optional-rpms --enable rhel-7-server-extras-rpms
echo "16%"
sleep 2
#instalar mariaDb php phpmyadmin
echo "Instalar MariaDb Php PhpMyAdmin"
sleep 2
yum -y install mariadb-server mariadb php74-php php74-php-mysql php74-php-gd php74-php-pear php74-php-mbstring
yum repolist
yum check-update
yum -y install phpmyadmin

