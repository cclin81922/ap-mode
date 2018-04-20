#!/bin/bash

yum -y update
yum -y install httpd mod_wsgi
systemctl disable httpd
