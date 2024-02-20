FROM debian:bullseye

RUN apt-get update && apt-get install -y curl tar

RUN curl -L https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz | tar -xz -C /tmp && \
    mv /tmp/portainer/ /usr/local/bin/portainer && rm -rf /tmp/*

# RUN echo $PORTAINER_PASSWORD > /admin_pass
ENV PORTAINER_PASSWORD=123456789012

RUN echo ${PORTAINER_PASSWORD} > /admin_pass

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/portainer/portainer" ]

CMD [ "--admin-password-file=/admin_pass" ]


# CMD [ "/usr/local/bin/portainer/portainer", "--admin-password-file", "123456789012" ]
###### helpfull tools ######
# show certificate details: openssl x509 -in nginx-selfsigned.crt -noout -text
# docker build -t portainer .
# docker run -d --name portainer -p 9001:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer
# docker exec -it portainer bash
# docker container stop portainer && docker container rm portainer
# ip addr show | grep inet
# /usr/local/bin/portainer/portainer --admin-password=testNewOne@13
# /usr/local/bin/portainer/portainer --admin-password-file=/data/admin_pass