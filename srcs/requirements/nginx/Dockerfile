FROM debian:bullseye

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


RUN apt update -y
RUN apt install -y curl
RUN apt install -y nginx
RUN apt install -y openssl
RUN openssl req -x509 -newkey rsa:4096 -days 365 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -nodes -subj /C=MO/L=KHOURIBGA/O=1337/OU=student/CN=mel-aini.42.fr

# for debugging
RUN apt install -y inetutils-ping
RUN apt install -y mariadb-client

# title: Add the Self-Signed Certificate to the Trusted Certificates
# RUN update-ca-certificates

# RUN mkdir /var/www/inception

COPY conf/inception.conf /etc/nginx/sites-available/inception
RUN ln -s /etc/nginx/sites-available/inception /etc/nginx/sites-enabled/

# EXPOSE 8080

ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]


###### helpfull tools ######
# show certificate details: openssl x509 -in nginx-selfsigned.crt -noout -text
# docker build -t nginx .
# docker run -d --name nginx -p 443:443 --add-host wordpress:172.17.0.4 -v wordpress:"/var/www/inception" nginx
# docker exec -it nginx1 bash
# docker container stop nginx1 && docker container rm nginx1
# docker container rm -f $(docker container ls -q)