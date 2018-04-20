#!/bin/bash

set -e

echo 'being ap' > /opt/ap-mode

systemctl unmask CODENAME
systemctl unmask keepalived
systemctl unmask httpd
systemctl unmask mysql

systemctl disable CODENAME
systemctl disable keepalived
systemctl disable httpd
systemctl disable mysql

echo 'ap' > /opt/ap-mode