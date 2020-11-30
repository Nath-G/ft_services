FROM alpine

RUN apk update && apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx
 
COPY srcs/wordpress-5.5.3.tar.gz .
# RUN wget https://wordpress.org/latest.tar.gz \
#latest.tar.gz \
RUN tar -xf wordpress-5.5.3.tar.gz \
&& mv wordpress/* /www \
&& rm -rf /var/cache/apk/*
# RUN rm wordpress-5.5.3.tar.gz
# RUN rm etc/php7/php.ini
# COPY srcs/php.ini etc/php7/php.ini

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/wp-config.php /www/wp-config.php
COPY srcs/wp-conten/t/uploads/2020/01/ /www/wp-content/uploads/2020/01/
COPY .srcs/telegraf.conf ./etc/telegraf.conf
COPY ./srcs/install.sh ./install.sh
COPY srcs/setup.sh .

RUN mkdir /run/nginx

RUN chmod +x setup.sh
RUN  chmod +x install.sh
COPY srcs/wp-content/uploads/2020/01/ /www/wp-content/uploads/2020/01/

RUN rm wordpress-5.5.3.tar.gz

EXPOSE 5050
RUN sh /install.sh
# CMD ./setup.sh

ENTRYPOINT  /etc/init.d/telegraf start; ./setup.sh