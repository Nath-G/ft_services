FROM alpine

USER root

#RUN rm /etc/nginx/conf.d/default.conf
#RUN rm /etc/nginx/sites-enable/default

COPY srcs/install.sh /tmp/install.sh
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/index.html /var/www/localhost/htdocs/index.html
COPY srcs/sshd_config /etc/ssh/

RUN sh /tmp/install.sh

EXPOSE 80 443 22

ENTRYPOINT  nginx -g "daemon off;"
# /etc/init.d/sshd start;