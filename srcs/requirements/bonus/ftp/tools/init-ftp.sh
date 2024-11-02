#!/bin/bash

mkdir -p /var/run/vsftpd/empty

if [[ ! -f "/home/$FTP_USER/ftp" ]]; then
useradd $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -p /home/$FTP_USER/ftp /home/$FTP_USER/ftp/test

chown nobody:nogroup /home/$FTP_USER/ftp /home/$FTP_USER/ftp/test

chmod a-w /home/$FTP_USER/ftp

chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/test

echo $FTP_USER > /etc/vsftpduserlist.conf

fi

exec "$@"