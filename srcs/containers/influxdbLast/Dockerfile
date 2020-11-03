FROM alpine

RUN apk update && apk add influxdb \
&& apk add --no-cache --upgrade bash

# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY srcs/setup.sh .
# COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN chmod +x setup.sh

COPY srcs/init_influxdb.sh .
RUN chmod +x init_influxdb.sh
CMD sh init_influxdb.sh
EXPOSE 8086 
# 8088


ENTRYPOINT ./setup.sh;
# /etc/init .d/telegraf start;