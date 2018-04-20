#!/bin/bash

yum -y install python-pip

pip install falcon==1.4.1
pip install SQLAlchemy==1.2.6
pip install prometheus_client==0.2.0
pip install gunicorn==19.7.1    # for dev-time only

yum -y groupinstall 'Development Tools'
yum -y install python-devel mariadb-devel MySQL-python
pip install MySQL-python==1.2.5 # SQLAlchemy dep

# Note
# for mac user, run `brew install mysql`