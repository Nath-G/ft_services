#!/bin/sh
adduser -D -h /var/ftp $FTPS_USER
echo "$FTPS_USER:$FTPS_PASSWORD" | chpasswd
vsftpd /etc/vsftpd/vsftpd.conf
