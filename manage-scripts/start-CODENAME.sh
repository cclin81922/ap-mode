#!/bin/bash

setenforce 0
systemctl stop firewalld
systemctl start mysql
systemctl start httpd
systemctl start keepalived
