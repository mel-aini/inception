FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install -y wget apache2 php libapache2-mod-php php-curl php-cli php-mysql php-gd

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

RUN chown -R www-data:www-data /var/www/html/adminer.php
RUN chmod 755 /var/www/html/adminer.php
RUN sed -i "s/Listen 80/Listen 81/" /etc/apache2/ports.conf

CMD apachectl -DFOREGROUND

###### helpfull tools ######
# docker build -t adminer .
# docker run -d --name adminer -p 8000:80 adminer
# docker exec -it adminer bash
# docker container stop adminer && docker container rm adminer
# docker container rm -f $(docker container ls -q)