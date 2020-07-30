apk update
apk add nginx openssl openrc openssh --no-cache #openrc permet d'activer le sercice automatiquement
#ssh-keygen -A

echo "avant adduser"
adduser --gecos GECOS adminssh

echo "apres adduser";
echo "adminssh:adminsshpw" | chpasswd #change de pawwsword a la 1ere connection
echo "apres chpasswd"

chown -R adminssh:adminssh /var/lib/nginx 
echo "apres chown 1/n"
chown -R adminssh:adminssh /var/www
echo "apres chown 2"
#change owner and allow modify index
chmod -R a+w /var/www
chmod -R a+w /etc/ssl
echo "apres 2 chmod"
yes "" | openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt -keyout /etc/ssl/certs/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=nagresel/CN=ft_services"
echo "apres ssl"
mkdir -p /run/nginx
echo "apres mkdir"
openrc #permet au system de switcher sur le runlevel 
echo "apres openrc"
touch /run/openrc/softlevel #start the runlevel specified by the softlevel parameter if provided /etc/rc.conf
echo "apres softlevel"
rc-update add sshd #Configure le service pour qu'il soit lance automatiquement au demarrage du systeme
echo "apres sshd"