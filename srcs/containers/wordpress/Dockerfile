FROM alpine

RUN apk update && apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& mv wordpress/* /www \
&& rm -rf /var/cache/apk/*
# RUN rm -r wordpress
COPY srcs/nginx.conf /etc/nginx/nginx.conf
# RUN rm etc/php7/php.ini
# COPY srcs/php.ini etc/php7/php.ini
RUN mkdir /run/nginx

COPY srcs/wp-config.php /www/wp-config.php
COPY srcs/wp-content/uploads/2020/01/ /www/wp-content/uploads/2020/01/
COPY srcs/telegraf.conf /etc/telegraf.conf
COPY srcs/install.sh .
COPY srcs/setup.sh .

RUN chmod +x setup.sh
RUN  chmod +x install.sh
COPY srcs/wp-content/uploads/2020/01/ /www/wp-content/uploads/2020/01/
EXPOSE 5050
RUN sh ./install.sh
# CMD ./setup.sh

ENTRYPOINT  /etc/init.d/telegraf start; ./setup.sh