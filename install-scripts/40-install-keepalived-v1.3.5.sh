#!/bin/bash

yum -y update
yum -y install keepalived
systemctl disable keepalived
