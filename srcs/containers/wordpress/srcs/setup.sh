#!/bin/sh
# tail -f /var/log/nginx/error.log -n 0 &
php-fpm7
nginx -g 'daemon off;'
