FROM alpine

RUN apk update && apk add influxdb \
&& apk add --no-cache --upgrade bash

COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 8086

ENTRYPOINT ./setup.sh