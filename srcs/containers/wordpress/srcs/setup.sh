# tail -f /var/log/nginx/error.log -n 0 &
# service php-fpm7 stop
#!/bin/bash
php-fpm7
nginx -g 'daemon off;'
