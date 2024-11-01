FROM debian:bullseye

RUN apt update -y
RUN apt install -y curl
RUN apt install -y nginx
RUN apt install -y openssl
RUN openssl req -x509 -newkey rsa:4096 -days 365 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -nodes -subj /C=MO/L=KHOURIBGA/O=1337/OU=student/CN=mel-aini.42.fr

COPY conf/inception.conf /etc/nginx/sites-available/inception
RUN ln -s /etc/nginx/sites-available/inception /etc/nginx/sites-enabled/

EXPOSE 443

ENTRYPOINT [ "nginx" ]

CMD [ "-g", "daemon off;" ]