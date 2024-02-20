
file = ./srcs/docker-compose.yml

all:
	docker compose -f $(file) up --build

run:
	docker compose -f $(file) up

vclean:
	sudo rm -rf /home/mel-aini/data/mariadb/*
	sudo rm -rf /home/mel-aini/data/wordpress/*

no_cache:
	docker compose -f $(file) build --no-cache
	docker compose -f $(file) up

clean:
	docker compose -f $(file) down

fclean: clean vclean
	docker compose -f $(file) down --rmi all -v

re: fclean all