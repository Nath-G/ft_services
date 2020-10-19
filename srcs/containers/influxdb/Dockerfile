FROM alpine

RUN apk update && apk add influxdb \
&& apk add --no-cache --upgrade bash

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY srcs/setup.sh .
COPY srcs/telegraf.conf /etc/telegraf.conf

RUN chmod +x setup.sh

EXPOSE 8086 8088

ENTRYPOINT /etc/init.d/telegraf start; ./setup.sh