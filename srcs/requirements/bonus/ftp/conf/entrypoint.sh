#!/bin/bash

while true; do
	if [ $(find /home/newuser/ -name wp-config.php | wc -l) -ne 0 ]; then
		echo "wp-config.php found"
		break
	fi
done

chown -R newuser:newuser /home/newuser
chmod -R 755 /home/newuser

vsftpd