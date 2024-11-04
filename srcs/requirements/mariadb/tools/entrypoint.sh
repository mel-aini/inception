mysql_install_db --user=mysql --ldata=/var/lib/mysql

service mariadb start

mariadb -h localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE ${MYSQL_DATABASE};"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER '${MYSQL_ADMIN}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ADMIN}'@'%';"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

mariadb-admin -p$MYSQL_ROOT_PASSWORD shutdown

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

mariadbd