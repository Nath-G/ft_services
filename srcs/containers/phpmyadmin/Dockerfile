FROM alpine

RUN apk update && apk upgrade && apk add bash \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx

COPY srcs/phpMyAdmin-5.0.1-english.tar.gz .

RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz \
&& mv phpMyAdmin-5.0.1-english /www \
&& rm -rf /var/cache/apk/*

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/config.inc.php /www/config.inc.php
COPY srcs/setup.sh .
COPY ./srcs/install.sh ./install.sh
COPY ./srcs/telegraf.conf ./etc/telegraf.conf

RUN mkdir /run/nginx
RUN mkdir /www/tmp

RUN chmod +x install.sh
RUN chmod +x setup.sh
RUN chmod -R 777 /www/tmp/
RUN sh /install.sh

RUN rm phpMyAdmin-5.0.1-english.tar.gz

EXPOSE 5000

ENTRYPOINT /etc/init.d/telegraf start; ./setup.sh
