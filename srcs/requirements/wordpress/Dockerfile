FROM debian:bullseye

RUN apt update
RUN apt install -y php7.4-fpm php-mysql curl

RUN apt install -y inetutils-ping

WORKDIR /var/www/inception
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT [ "bash" ]

CMD [ "/entrypoint.sh" ]