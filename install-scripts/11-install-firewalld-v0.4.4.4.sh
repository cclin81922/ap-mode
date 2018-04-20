#!/bin/bash

yum -y update
yum -y install firewalld
systemctl disable firewalld
