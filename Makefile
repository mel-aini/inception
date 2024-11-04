
file = ./srcs/docker-compose.yml

all: pre
	docker compose -f $(file) up --build

pre:
	mkdir -p /home/mel-aini/data/mariadb /home/mel-aini/data/wordpress

run: pre
	docker compose -f $(file) up

vclean:
	sudo rm -rf /home/mel-aini/data/mariadb/*
	sudo rm -rf /home/mel-aini/data/wordpress/*

no_cache: pre
	docker compose -f $(file) build --no-cache
	docker compose -f $(file) up

clean:
	docker compose -f $(file) down

fclean: clean vclean
	docker compose -f $(file) down --rmi all -v

re: fclean all