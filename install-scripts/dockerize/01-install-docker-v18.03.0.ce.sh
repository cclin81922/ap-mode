#!/bin/bash

yum -y update
yum -y install yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#yum-config-manager --enable docker-ce-edge
yum -y install docker-ce
#yum list docker-ce --showduplicates | sort -r
yum -y install docker-ce-18.03.0.ce
systemctl disable docker
