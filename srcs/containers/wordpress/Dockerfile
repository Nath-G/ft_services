FROM alpine

USER root

COPY srcs/install.sh /tmp/install.sh
# COPY srcs/wp-config_model.php /var/www/localhost/htdocs/wp-config.php
COPY srcs/wp-config.php /var/www/localhost/htdocs/wp-config.php

ADD https://fr.wordpress.org/latest-fr_FR.tar.gz /tmp/

RUN sh /tmp/install.sh && rm -f /tmp/install.sh
#COPY srcs/wordpress_model.sql /var/www/localhost/htdocs/worpress.sql

#COPY srcs/telegraf.conf /etc/telegraf.conf
 
EXPOSE 5050

ENTRYPOINT lighttpd -D -f /etc/lighttpd/lighttpd.conf
#/etc/init.d/telegraf start; 