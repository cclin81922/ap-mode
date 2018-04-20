#!/bin/bash

cp ../data/keepalived-conf/host2.conf /etc/keepalived/keepalived.conf
cp ../data/keepalived-scripts/host2/do-check.sh /usr/local/bin/do-check.sh
cp ../data/keepalived-scripts/host2/do-when-backup.sh /usr/local/bin/do-when-backup.sh
cp ../data/keepalived-scripts/host2/do-when-fault.sh /usr/local/bin/do-when-fault.sh
cp ../data/keepalived-scripts/host2/do-when-master.sh /usr/local/bin/do-when-master.sh