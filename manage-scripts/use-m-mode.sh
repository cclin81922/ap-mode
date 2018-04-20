#!/bin/bash

set -e

echo 'being m' > /opt/ap-mode

systemctl mask CODENAME
systemctl mask keepalived
systemctl mask httpd
systemctl mask mysql

echo 'm' > /opt/ap-mode