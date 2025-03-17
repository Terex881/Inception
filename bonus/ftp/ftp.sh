#!/bin/bash

service vsftpd start

useradd -m "$FTP_USER"
echo  "$FTP_USER:$FTP_PASS" | chpasswd

mkdir -p /home/$FTP_USER/ftp
chown -R "$FTP_USER:$FTP_USER" /home/$FTP_USER/ftp

echo "$FTP_USER" >> /etc/vsftpd.userlist

echo "anonymous_enable=NO
local_enable=YES
write_enable=YES
user_sub_token=$FTP_USER
local_root=/home/$FTP_USER/ftp
pasv_min_port=50000
pasv_max_port=50001
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO" >> /etc/vsftpd.conf

service vsftpd stop

exec vsftpd