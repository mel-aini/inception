mysql_install_db --user=mysql --ldata=/var/lib/mysql

service mariadb start

mariadb -h localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE ${MYSQL_DATABASE};"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mariadb -h localhost -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

mariadb-admin -p$MYSQL_ROOT_PASSWORD shutdown

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

mariadbd

# sleep infinity

###### helpfull tools ######
# show certificate details: openssl x509 -in nginx-selfsigned.crt -noout -text
# docker build -t mariadb .
# docker build -t mariadb --no-cache .
# --no-cache
# docker run -d --name mariadb mariadb
# docker exec -it mariadb1 bash
# docker container stop mariadb1 && docker container rm mariadb1