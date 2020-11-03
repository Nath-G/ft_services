FROM alpine

RUN apk update \
&& apk add --no-cache --upgrade bash

# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
RUN tar -zxf telegraf-1.15.2_linux_amd64.tar.gz 
RUN mv telegraf-1.15.2 telegraf
COPY srcs/setup.sh .
# RUN rm /etc/telegraf.conf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

RUN chmod +x setup.sh

# EXPOSE 4999

ENTRYPOINT ./setup.sh
# /etc/init.d/telegraf start;