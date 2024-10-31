all :
	mkdir -p ~/data/wordpress ~/data/mariadb
	docker compose  -f ./srcs/docker-compose.yml up -d --build
down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	rm -rf ~/data/mariadb ~/data/wordpress