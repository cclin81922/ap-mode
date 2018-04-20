#!/bin/bash

state=$(systemctl is-active keepalived)
printf '%-12s : %-10s\n' router $state

state=$(systemctl is-active httpd)
printf '%-12s : %-10s\n' api-server $state

state=$(systemctl is-active mysql)
printf '%-12s : %-10s\n' database $state