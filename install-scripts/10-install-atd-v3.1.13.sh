#!/bin/bash

yum -y update
yum -y install at
systemctl enable atd
systemctl start atd
