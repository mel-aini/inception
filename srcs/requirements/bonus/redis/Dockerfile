FROM debian:bullseye

RUN apt update
RUN apt install -y redis iproute2

RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/' /etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server",  "--daemonize no", "--protected-mode no"  ]

###### helpfull tools ######
# docker build -t redis .
# docker run -d --name redis -p 6379:6379 redis
# docker exec -it redis bash
# docker container stop redis1 && docker container rm redis1
# docker container rm -f $(docker container ls -q)