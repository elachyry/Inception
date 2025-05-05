#!/bin/bash

# Create user
adduser $ftp_user --disabled-password

# Set user password
echo "$ftp_user:$ftp_pwd" | chpasswd

# Add user to vsftpd.userlist
echo "$ftp_user" | tee -a /etc/vsftpd.userlist

# Prepare folders
mkdir -p /home/$ftp_user/ftp/files
chown nobody:nogroup /home/$ftp_user/ftp
chmod a-w /home/$ftp_user/ftp
chown $ftp_user:$ftp_user /home/$ftp_user/ftp/files

# Configure vsftpd
sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf

echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=40005
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=NO
local_root=/home/$ftp_user/ftp
" >> /etc/vsftpd.conf

mkdir -p /var/run/vsftpd/empty

# Finally start vsftpd in foreground
/usr/sbin/vsftpd /etc/vsftpd.conf
