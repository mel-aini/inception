FROM debian:bullseye

RUN apt update && apt install vsftpd systemctl -y

RUN useradd newuser -m -s /bin/bash
RUN echo "newuser:123" | chpasswd

RUN echo "pasv_enable=YES" >> /etc/vsftpd.conf
RUN echo "pasv_min_port=40000" >> /etc/vsftpd.conf
RUN echo "pasv_max_port=40100" >> /etc/vsftpd.conf

RUN sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
RUN sed -i "s/#local_umask=022/local_umask=022/" /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty
RUN chmod 555 /var/run/vsftpd/empty

# RUN chown -R newuser:newuser /home/newuser
# RUN chmod -R 755 /home/newuser

COPY ./conf/entrypoint.sh entrypoint.sh

CMD [ "bash", "entrypoint.sh" ]

# ##### helpfull tools ######
# docker build -t ftp .
# --no-cache
# docker run -d --name ftp ftp
# docker run -d --name ftp -v wordpress:"/var/www/inception" ftp
# docker exec -it ftp bash
# docker container stop ftp && docker container rm ftp