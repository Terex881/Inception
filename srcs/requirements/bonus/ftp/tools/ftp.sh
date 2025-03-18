#!/bin/bash

FTP_PASS=$(cat /run/secrets/ftp_user_password)

service vsftpd start
useradd -m "$FTP_USER"
echo "$FTP_USER:$FTP_PASS" | chpasswd

mkdir -p /home/$FTP_USER/ftp
chown -R "$FTP_USER:$FTP_USER" /home/$FTP_USER/ftp
echo "$FTP_USER" >> /etc/vsftpd.userlist

echo "anonymous_enable=NO
local_enable=YES
write_enable=YES
pasv_enable=YES
pasv_min_port=50000
pasv_max_port=50001
pasv_address=0.0.0.0
local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf

service vsftpd stop
exec vsftpd