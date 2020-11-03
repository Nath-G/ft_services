FROM alpine

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz \
&& tar -zxvf grafana-6.6.0.linux-amd64.tar.gz \
&& rm /grafana-6.6.0/conf/defaults.ini \
&& rm -rf /var/cache/apk/* 	
RUN mv ./grafana-6.6.0/ ./grafana/
# added mv
# COPY ./srcs/defaults.ini ./grafana-6.6.0/conf/
COPY ./srcs/defaults.ini ./grafana/conf/
# COPY ./srcs/grafana.db ./grafana-6.6.0/data/
COPY ./srcs/setup.sh .
COPY ./srcs/datasources.yaml /grafana/conf/provisioning/datasources/
COPY ./srcs/dashboard.yaml /grafana/conf/provisioning/dashboards/
# COPY ./srcs/datasources.yaml /grafana/provisioning/datasources/
# COPY ./srcs/dashboard.yaml /grafana/provisioning/dashboards/

# COPY ./srcs/datasources.yaml /etc/grafana/provisioning/datasources/
# COPY ./srcs/dashboard.yaml /etc/grafana/provisioning/dashboards/
# COPY ./srcs/*.json /etc/grafana/provisioning/dashboards/
COPY ./srcs/*.json /grafana/provisioning/dashboards/
RUN chmod +x setup.sh
RUN rm grafana-6.6.0.linux-amd64.tar.gz
EXPOSE 3000

ENTRYPOINT ./setup.sh