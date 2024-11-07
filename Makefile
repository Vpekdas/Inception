all :
	mkdir -p ~/data/wordpress ~/data/mariadb ~/data/portainer
	docker compose  -f ./srcs/docker-compose.yml up -d --build
down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	sudo rm -rf ~/data/mariadb ~/data/wordpress ~/data/portainer