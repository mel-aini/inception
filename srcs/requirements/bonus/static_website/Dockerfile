FROM debian:bullseye

RUN apt update -y
RUN apt install -y curl
RUN apt install -y nginx

WORKDIR /var/www/static_website

COPY conf/static_website.conf /etc/nginx/sites-available/static_website
RUN ln -s /etc/nginx/sites-available/static_website /etc/nginx/sites-enabled/

COPY ./conf/public/* .

RUN chown -R www-data:www-data /var/www/static_website
RUN chmod -R 755 /var/www/static_website

EXPOSE 8080

ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]


###### helpfull tools ######
# show certificate details: openssl x509 -in nginx-selfsigned.crt -noout -text
# docker build -t nginx .
# docker run -d --name nginx -p 443:443 --add-host wordpress:172.17.0.4 -v wordpress:"/var/www/inception" nginx
# docker exec -it nginx1 bash
# docker container stop nginx1 && docker container rm nginx1
# docker container rm -f $(docker container ls -q)