FROM alpine

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

COPY srcs/grafana-7.3.0.linux-amd64.tar.gz .
RUN tar -zxf grafana-7.3.0.linux-amd64.tar.gz \
&& rm /grafana-7.3.0/conf/defaults.ini \
&& rm -rf /var/cache/apk/* 	
RUN mv ./grafana-7.3.0/ ./grafana/

COPY ./srcs/defaults.ini ./grafana/conf/
COPY ./srcs/setup.sh .
COPY ./srcs/datasources.yaml ./grafana/conf/provisioning/datasources/
COPY ./srcs/dashboard.yaml ./grafana/conf/provisioning/dashboards/
COPY ./srcs/telegraf.conf ./etc/telegraf.conf
COPY ./srcs/install.sh .
COPY ./srcs/*.json ./grafana/conf/provisioning/dashboards/


RUN chmod +x setup.sh
RUN chmod +x install.sh

RUN sh ./install.sh
RUN rm grafana-7.3.0.linux-amd64.tar.gz
EXPOSE 3000

ENTRYPOINT /etc/init.d/telegraf start; ./setup.sh
