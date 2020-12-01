apk update
apk add nginx openssl openrc openssh --no-cache #openrc permet d'activer le sercice automatiquement

apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

adduser --gecos GECOS adminssh
echo "adminssh:adminssh" | chpasswd #change de pawwsword a la 1ere connection

chown -R adminssh:adminssh /var/lib/nginx 
chown -R adminssh:adminssh /var/www
#change owner and allow modify index
chmod -R a+w /var/www
chmod -R a+w /etc/ssl

yes "" | openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/certs/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=nagresel/CN=ft_services"

mkdir -p /run/nginx
openrc #permet  system de switcher sur le runlevel 
touch /run/openrc/softlevel #start the runlevel specified by the softlevel parameter if provided /etc/rc.conf
rc-update add telegraf
rc-update add sshd #Configure le service pour qu'il soit lance automatiquement au demarrage du systeme
