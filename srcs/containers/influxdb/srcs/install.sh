#!/bin/sh

apk update
apk add openrc --no-cache
apk add telegraf influxdb --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache 

openrc
touch /run/openrc/softlevel
rc-update add telegraf

# telegraf ./etc/telegraf/telegraf.conf

#bin/bash
# apk update
# apk add openrc --no-cache #openrc permet d'activer le sercice automatiquement
# apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
# wget  https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
# tar -zxf telegraf-1.15.2_linux_amd64.tar.gz 
# mv ./telegraf-1.15.2/ ./telegraf/
# rm  telegraf-1.15.2_linux_amd64.tar.gz
# RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
# RUN tar -zxf telegraf-1.15.2_linux_amd64.tar.gz 


# wget http://dl-cdn.alpinelinux.org/alpine/edge/testing/x86_64/telegraf-1.16.1-r1.apk

# adduser --gecos GECOS adminssh

# echo "adminssh:adminssh" | chpasswd #change de pawwsword a la 1ere connection

# chown -R adminssh:adminssh /var/lib/nginx 
# chown -R adminssh:adminssh /var/www
#change owner and allow modify index
# chmod -R a+w /var/www
# # chmod -R a+w /etc/telegraf
# chmod -R a+w /telegraf
# # yes "" | openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/certs/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=nagresel/CN=ft_services"

# mkdir -p /run/telegraf
# openrc #permet  system de switcher sur le runlevel 
# touch /run/openrc/softlevel #start the runlevel specified by the softlevel parameter if provided /etc/rc.conf
# rc-update add telegraf #Configure le service pour qu'il soit lance automatiquement au demarrage du systeme