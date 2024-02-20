FROM debian:bullseye

RUN apt update
RUN apt install -y wget php7.4-fpm php-mysql curl vim mariadb-client

# !to delete:
# ENV MYSQL_ROOT_PASSWORD=123
# ENV MYSQL_USER=mel-aini
# ENV MYSQL_PASSWORD=123
# ENV MYSQL_ADMIN=mohssine
# ENV MYSQL_ADMIN_PASSWORD=123
# # DATABASE NAME
# ENV MYSQL_DATABASE=wordpress
# ENV MYSQL_HOST=mariadb
# # WORDPRESS SETUP
# ENV MYSITE_URL=example.com
# ENV MYSITE_TITLE=inception
# ENV MYSITE_ADMIN_USERNAME=mel-aini
# ENV MYSITE_ADMIN_PASSWORD=123
# ENV MYSITE_ADMIN_EMAIL=mohssineelaini10@gmail.com

# for testing
RUN apt install -y inetutils-ping
# RUN mkdir /var/www/
# RUN mkdir /var/www/inception
WORKDIR /var/www/inception
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download --allow-root
# RUN wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
# RUN wp core install --url=$MYSITE_URL --title=$MYSITE_TITLE --admin_user=$MYSITE_ADMIN_USERNAME --admin_password=$MYSITE_ADMIN_PASSWORD --admin_email=$MYSITE_ADMIN_EMAIL --allow-root

RUN mkdir -p /run/php
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
# RUN chmod +x wp-cli.phar 
# RUN mv wp-cli.phar /usr/local/bin/wp

# RUN wp core download

# # Generate the wp-config.php file with our database details.
# RUN wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD

# # install wordpress
# RUN wp core install --url=$MYSITE_URL --title=$MYSITE_TITLE --admin_user=$MYSITE_ADMIN_USERNAME --admin_password=$MYSITE_ADMIN_PASSWORD --admin_email=$MYSITE_ADMIN_EMAIL
COPY ./tools/entrypoint.sh /entrypoint.sh
# COPY conf/wp-config.php ./wp-config.php

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
# COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT [ "bash" ]

CMD [ "/entrypoint.sh" ]

# COPY ./conf/wp-config.php /var/www/html/wp-config.php

# ##### helpfull tools ######
# docker build -t wordpress .
# docker build -t wordpress --no-cache .
# docker run -d --name wordpress -p 9000:9000 --add-host mariadb:172.17.0.2 --add-host redis:172.17.0.3 -v wordpress:"/var/www/inception" wordpress
# docker exec -it wordpress1 bash
# docker container stop wordpress1 && docker container rm wordpress1
# mariadb -u mel-aini -p123 -h mariadb