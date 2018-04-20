#!/bin/bash

set -e

echo 'being s' > /opt/ap-mode

systemctl unmask CODENAME
systemctl unmask keepalived
systemctl unmask httpd
systemctl unmask mysql

systemctl enable CODENAME
systemctl disable keepalived
systemctl disable httpd
systemctl disable mysql

echo 's' > /opt/ap-mode