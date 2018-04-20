#!/bin/bash

systemctl start mysql
mysql < ../data/mysqld-conf/host2-init.sql
