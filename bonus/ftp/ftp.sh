#!/bin/bash

service vsftpd start

useradd -m "$USERFTP"
echo "$USERFTP:$PASSFTP" | chpasswd

mkdir -p /home/$USERFTP/ftp
chown -R "$USERFTP:$USERFTP" /home/$USERFTP/ftp

echo "$USERFTP" >> /etc/vsftpd.userlist
   
echo "pasv_enable=YES
pasv_address=0.0.0.0
pasv_min_port=50000
pasv_max_port=50001
listen=YES         
anonymous_enable=NO
local_enable=YES   
write_enable=YES
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf


service vsftpd stop

exec vsftpd