#!/bin/bash

yum --enablerepo=centos-sclo-rh -y install rh-mariadb102-mariadb-server

scl enable rh-mariadb102 bash

mysql -V

which mysql

