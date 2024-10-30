FROM debian:bullseye

RUN apt update -y
RUN apt install curl -y

RUN curl -sSL https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 \
	-o /usr/local/bin/cadvisor && \
	chmod +x /usr/local/bin/cadvisor

EXPOSE 8083

ENTRYPOINT [ "/usr/local/bin/cadvisor" ]

CMD [ "--port=8083" ]

