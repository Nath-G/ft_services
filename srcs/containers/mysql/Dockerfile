FROM alpine

# VOLUME /var/run/docker.sock:/var/run/docker.sock

# Installation
RUN apk update \
&& apk add mariadb mariadb-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

# Copy initialisation script
COPY ./srcs/init_docker.sh .
COPY ./srcs/init_mysql.sh .
COPY ./srcs/wp.sql ./
COPY ./srcs/telegraf.conf ./etc/telegraf.conf
COPY ./srcs/install.sh ./install.sh

# Add permission
RUN chmod 777 init_docker.sh
RUN chmod 777 init_mysql.sh
RUN chmod 777 install.sh

RUN sh /install.sh

EXPOSE 3306

# Start configuration script
# ENTRYPOINT [ "./etc/init.d/telegraf start" ; "./init_docker.sh" ]
ENTRYPOINT /etc/init.d/telegraf start ; ./init_docker.sh
