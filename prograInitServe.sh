#!/bin/bash

#actulisar servidor
echo "Actulisar servidor"
yum -y update &> /dev/null
echo "10%"
#instalar ifconfig
echo "Instalar ifconfig"
yum -y install net-tools &> /dev/null
echo "12%"
#instalar nano
echo "Instalar nano"
yum -y install nano &> /dev/null
echo "13%"
#instalar apache
echo "Instalar apache"
yum -y install httpd &> /dev/null
echo "15%"
systemctl start httpd
systemctl enable httpd
systemctl restart httpd
#instalar php
echo "Instalar php"
yum -y install php php-mbstring php-pear &> /dev/null
systemctl restart httpd
echo "20%"
#instalar phpMyAdmin y mariaDb
#echo "Instalar phpMyAdmin y mariaDb"
#yum -y install httpd mariadb-server mariadb php php-mysql php-gd php-pear php-mbstring &> /dev/null
#systemctl start mariadb
#systemctl enable mariadb
#firewall-cmd --zone=public --remove-port=80/tcp --permanent
#firewall-cmd --zone=public --remove-port=3306/tcp --permanent
#firewall-cmd --reload
#echo "50%"



