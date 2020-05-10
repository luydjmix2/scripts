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
