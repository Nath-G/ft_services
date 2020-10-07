FROM alpine

RUN apk upgrade
RUN apk add openssl vsftpd
# RUN apk add jq curl
# ENV API_URL=https://kubernetes
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=nagresel/CN=ft_services" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
# /C=FR/ST=Denial/L=-/O=-/CN=127.0.0.1
# /C=FR/ST=Paris/L=Paris/O=42 School/OU=nagresel/CN=ft_services
RUN mkdir -p /var/ftp

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY srcs/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
# RUN mkdir /ftpsadmin

EXPOSE 20 21 30000

ENTRYPOINT ["/tmp/setup.sh"]