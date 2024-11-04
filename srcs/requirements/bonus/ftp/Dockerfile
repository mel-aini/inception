FROM debian:bullseye

RUN apt update && apt install vsftpd systemctl -y

COPY ./tools/entrypoint.sh entrypoint.sh

EXPOSE 21

CMD [ "bash", "entrypoint.sh" ]