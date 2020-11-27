FROM alpine

RUN apk update && apk upgrade && apk add bash \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz \
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz \
&& tar -xvf phpMyAdmin-5.0.1-english.tar.gz \
&& mv phpMyAdmin-5.0.1-english /www \
&& rm -rf /var/cache/apk/*

# COPY srcs/phpmyadmin.inc.php /www/config.inc.php
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/config.inc.php /www/config.inc.php
COPY srcs/setup.sh .
COPY ./srcs/install.sh ./install.sh
COPY ./srcs/telegraf.conf ./etc/telegraf.conf

RUN mkdir /run/nginx

RUN chmod +x install.sh
RUN chmod +x setup.sh

RUN sh /install.sh

EXPOSE 5000

ENTRYPOINT /etc/init.d/telegraf start ; ./setup.sh