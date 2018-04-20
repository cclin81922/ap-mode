#!/bin/bash

systemctl start mysql
mysql < ../data/mysqld-conf/host1-init.sql
