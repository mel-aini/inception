#!/bin/bash

useradd $FTP_USER -m -s /bin/bash
echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd

echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd.conf
echo "pasv_max_port=40100" >> /etc/vsftpd.conf

sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
sed -i "s/#local_umask=022/local_umask=022/" /etc/vsftpd.conf

mkdir -p /var/run/vsftpd/empty
chmod 555 /var/run/vsftpd/empty

while true; do
	if [ $(find /home/$FTP_USER/ -name wp-config.php | wc -l) -ne 0 ]; then
		echo "wp-config.php found"
		break
	fi
done

chown -R "$FTP_USER:$FTP_USER" /home/$FTP_USER
chmod -R 755 /home/$FTP_USER

vsftpd