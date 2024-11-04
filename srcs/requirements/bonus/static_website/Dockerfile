FROM debian:bullseye

RUN apt update -y
RUN apt install -y nginx

WORKDIR /var/www/static_website

COPY conf/static_website.conf /etc/nginx/sites-available/static_website
RUN ln -s /etc/nginx/sites-available/static_website /etc/nginx/sites-enabled/

COPY ./conf/public/ .

RUN chown -R www-data:www-data /var/www/static_website
RUN chmod -R 755 /var/www/static_website

EXPOSE 8080

ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]