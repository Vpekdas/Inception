#!/bin/bash

mkdir -p /var/run/vsftpd/empty

if [[ ! -f "ftp" ]]; then
useradd testuser1
echo "testuser1:test123" | chpasswd

mkdir -p /home/testuser1/ftp /home/testuser1/ftp/test

chown nobody:nogroup /home/testuser1/ftp /home/testuser1/ftp/test

chmod a-w /home/testuser1/ftp

chown testuser1:testuser1 /home/testuser1/ftp/test

echo "testuser1" > /etc/vsftpduserlist.conf

touch ftp

fi

exec "$@"