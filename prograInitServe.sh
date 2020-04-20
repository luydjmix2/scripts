#!/bin/bash

#actulisar servidor
yum -y update &> /dev/null
echo "10%"
#instalar ifconfig
yum -y install net-tools &> /dev/null
echo "12%"
#instalar nano
yum -y install nano &> /dev/null
echo "13%"
#insalar apache
yum -y install httpd &> /dev/null
echo "15%"
