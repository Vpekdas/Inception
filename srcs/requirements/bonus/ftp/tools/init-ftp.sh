#!/bin/bash

# https://adamtheautomator.com/vsftpd/

# Create the directory if it does not exist to prevent errors.
mkdir -p /var/run/vsftpd/empty

if [[ ! -f "/home/$FTP_USER/ftp" ]]; then

# Use useradd to create the user without prompting for a password
# which will be set later.

useradd $FTP_USER

# Set up the password for the FTP user.
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -p /home/$FTP_USER/ftp /home/$FTP_USER/ftp/test

chown nobody:nogroup /home/$FTP_USER/ftp /home/$FTP_USER/ftp/test

chmod a-w /home/$FTP_USER/ftp

chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/test

echo $FTP_USER > /etc/vsftpduserlist.conf

fi

exec "$@"