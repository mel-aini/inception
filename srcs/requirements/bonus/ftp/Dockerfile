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

COPY ./conf/entrypoint.sh entrypoint.sh

CMD [ "bash", "entrypoint.sh" ]