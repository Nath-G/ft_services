#!/bin/bash

apk upgrade
apk add openrc
apk add mysql mysql-client --no-cache
# apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

mkdir -p /run/mysqld
cp -rp /var/run/mysqld /var/run/mysqld.bak
chown -R mysql:mysql /run/mysqld
echo "lol in install"

openrc
touch /run/openrc/softlevel
# rc-update add telegraf

echo "lol a la fin de install"