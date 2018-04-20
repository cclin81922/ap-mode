#!/bin/bash

<<USAGE
# e.g.,

export AP_CODENAME=CODENAME
export AP_VIP=192.168.202.33
export AP_HOST1IP=192.168.202.19
export AP_HOST2IP=192.168.202.6
export AP_HOSTNIC=eth0
export AP_MYSQLPASS=

bash $0
USAGE

AP_CODENAME=${AP_CODENAME:-CODENAME}
AP_VIP=${AP_VIP:-192.168.33.100}
AP_HOST1IP=${AP_HOST1IP:-192.168.33.101}
AP_HOST2IP=${AP_HOST2IP:-192.168.33.102}
AP_HOSTNIC=${AP_HOSTNIC:-enp0s8}
AP_MYSQLPASS=${AP_MYSQLPASS:-}

# Change file name
for f in $(find .. \( -path ../project-scripts -o -path ../.git -o -path ../.vagrant -o -path ../.gitignore -o -path ../Vagrantfile \) -prune -o -type f -name *CODENAME* -print)
do
    renamed_f=$(echo $f | sed 's/CODENAME/'$AP_CODENAME'/g')
    mv $f $renamed_f
done

# Change file content
for f in $(find .. \( -path ../project-scripts -o -path ../.git -o -path ../.vagrant -o -path ../.gitignore -o -path ../Vagrantfile \) -prune -o -type f -print)
do
    sed -i 's/CODENAME/'$AP_CODENAME'/g' $f
    sed -i 's/192.168.33.100/'$AP_VIP'/g' $f
    sed -i 's/192.168.33.101/'$AP_HOST1IP'/g' $f
    sed -i 's/192.168.33.102/'$AP_HOST2IP'/g' $f
    sed -i 's/enp0s8/'$AP_HOSTNIC'/g' $f
done

# TODO AP_MYSQLPASS
