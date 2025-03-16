#!/bin/bash

service vsftpd start

useradd -m "$USERFTP"
echo  "$USERFTP:$PASSFTP" | chpasswd

mkdir -p /home/$USERFTP/ftp
chown -R "$USERFTP:$USERFTP" /home/$USERFTP/ftp

echo "$USERFTP" >> /etc/vsftpd.userlist

echo "anonymous_enable=NO
local_enable=YES
write_enable=YES
user_sub_token=$USERFTP
local_root=/home/$USERFTP/ftp
pasv_min_port=50000
pasv_max_port=50001
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO" >> /etc/vsftpd.conf

service vsftpd stop

exec vsftpd