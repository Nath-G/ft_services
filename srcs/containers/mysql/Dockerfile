FROM alpine

USER root

COPY srcs/install.sh /tmp/install.sh
COPY srcs/start.sh /tmp/start.sh

RUN sh /tmp/install.sh 

# COPY srcs/telegraf.conf /etc/telegraf.conf

COPY srcs/my.cnf /usr/lib/my.cnf

VOLUME ["/var/lib/mysql"]

# EXPOSE 3306

ENTRYPOINT  sh /tmp/start.sh