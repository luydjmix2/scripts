#!/bin/bash

#actulisar servidor
echo "Actulisar servidor"
yum -y update
echo "10%"
#instalar ifconfig
echo "Instalar ifconfig"
yum -y install net-tools
echo "12%"
#instalar nano
echo "Instalar nano"
yum -y install nano
echo "13%"
#instalar apache
echo "Instalar apache"
yum -y install httpd
echo "15%"
systemctl start httpd
systemctl enable httpd
systemctl restart httpd
#instalar php
echo "Instalar php"
rpm -iUvh https://download-ib01.fedoraproject.org/pub/epel/6/SRPMS/Packages/e/epel-release-6-8.src.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php74
yum update -y
yum -y install php php-mysqlnd php-pdo php-mbstring php-pear php-pecl-zip php-mcrypt php-gd php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-soap curl curl-devel php74-php-cli php74u-json
systemctl restart httpd
echo "20%"
#instalar Unzip
echo "Intalando Unzip"
yum install unzip
Echo "21%"
#instalar phpMyAdmin y mariaDb
echo "Instalar phpMyAdmin y mariaDb"
yum -y install mariadb-server mariadb
systemctl restart httpd
echo "30%"
yum install phpmyadmin -y
echo "50%"
systemctl start mariadb
systemctl enable mariadb
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload
echo "52%"



