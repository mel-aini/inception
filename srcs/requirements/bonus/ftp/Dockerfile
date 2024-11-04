FROM debian:bullseye

RUN apt update && apt install vsftpd systemctl -y

COPY ./conf/entrypoint.sh entrypoint.sh

CMD [ "bash", "entrypoint.sh" ]