#!/bin/bash

#actulisar servidor
echo "Actulizar servidor"
yum -y update
echo "10%"
sleep 5
#instalar ifconfig
echo "Instalar ifconfig"
yum -y install net-tools
echo "12%"
sleep 5
#instalar nano
echo "Instalar nano"
yum -y install nano
echo "13%"
sleep 5
#instalar apache
echo "Instalar apache"
yum -y install httpd
echo "15%"
sleep 5
systemctl start httpd
systemctl enable httpd
systemctl restart httpd
#instalar phpMyAdmin
echo "Instalar phpMyAdmin"
#rpm -Uvh https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"  --enable "rhel-ha-for-rhel-*-server-rpms"
yum repolist
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php74
yum --enablerepo=remi -y install php74-php-mysql php74-php-mcrypt
yum --enablerepo=epel -y install phpMyAdmin
Ip=$(hostname -i)
sed -i "s|Require ip 127.0.0.1|Require ip 127.0.0.1 \"$Ip/24\"|g" /etc/httpd/conf.d/phpMyAdmin.conf
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload
systemctl restart httpd
echo "40%"
sleep 5
#instalar Unzip
echo "Intalando Unzip"
yum install unzip
echo "41%"
sleep 5
#instalar php
echo "Instalar php"
rpm -iUvh https://download-ib01.fedoraproject.org/pub/epel/6/SRPMS/Packages/e/epel-release-6-8.src.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php74
yum update -y
yum -y install php74-php php74-php-mysqlnd php74-php-pdo php74-php-mbstring php74-php-pear php74-php-pecl-zip php74-php-mcrypt php74-php-gd php74-php-gd php74-php-ldap php74-php-odbc php74-php-pear php74-php-xml php74-php-xmlrpc php74-php-mbstring php74-php-soap curl curl-devel
systemctl restart httpd
echo "50%"
sleep 5

#instaler mariaDb
echo "Intalar MariaDb"
password=$(</dev/urandom tr -dc A-Za-z0-9 | head -c12)
yum -y install mariadb-server
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation
echo $password
echo $password
firewall-cmd --add-service=mysql --permanent
firewall-cmd --reload




