# php -S 0.0.0.0:5000 -t ./www/
# tail -f /var/log/nginx/error.log -n 0 &
# service php-fpm7 stop
php-fpm7
nginx -g 'daemon off;'