#!/bin/bash

cat > /etc/yum.repos.d/MariaDB.repo <<DATA
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.2/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
DATA

yum -y update
yum -y install MariaDB-server MariaDB-client
systemctl disable mysql