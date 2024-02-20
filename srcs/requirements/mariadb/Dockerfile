FROM debian:bullseye

RUN apt update && apt install -y mariadb-server

# for testing
RUN apt install -y inetutils-ping

COPY ./tools/entrypoint.sh /entrypoint.sh

# RUN chmod -R 755 /var/lib/mysql
# RUN chown -R root:root /var/lib/mysql
EXPOSE 3306
# ENTRYPOINT [ "bash" ]
CMD [ "bash", "entrypoint.sh" ]
# ENTRYPOINT [ "mysqld" ]

###### helpfull tools ######
# docker build -t mariadb .
# docker run -d --name mariadb -p 3306:3306 mariadb
# docker exec -it mariadb1 bash
# docker container stop mariadb1 && docker container rm mariadb1
# ip addr show | grep inet