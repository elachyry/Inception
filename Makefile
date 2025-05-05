OS := $(shell uname)
VOLS=$(docker volume ls -q)

WP_VOLUME_DIR = /home/$(USER)/data/wordpress
MDB_VOLUME_DIR = /home/$(USER)/data/mariadb
PORT_VOLUME_DIR = /home/$(USER)/data/portainer

all: create-volumes
	docker compose -f ./srcs/docker-compose.yml up --build -d 
create-volumes:
	@if [ ! -d "$(MDB_VOLUME_DIR)" ]; then \
		mkdir -p $(MDB_VOLUME_DIR); \
	fi
	@if [ ! -d "${WP_VOLUME_DIR}" ]; then \
		mkdir -p $(WP_VOLUME_DIR); \
	fi
	@if [ ! -d "${PORT_VOLUME_DIR}" ]; then \
		mkdir -p $(PORT_VOLUME_DIR); \
	fi

bonus: create-volumes 
	docker compose -f ./srcs/requirements/bonus/docker-compose.yml up --build -d



up:
	docker compose -f ./srcs/docker-compose.yml up --build -d
down:
	docker compose -f ./srcs/docker-compose.yml down
clean:
	docker compose -f ./srcs/docker-compose.yml down -v

re: clean all


fclean: clean
	docker system prune -a -f
	docker volume prune -f
	docker network prune -f
	docker container prune -f
	docker image prune -f
	sudo rm -rf ${WP_VOLUME_DIR}
	sudo rm -rf ${MDB_VOLUME_DIR}
	sudo rm -rf ${PORT_VOLUME_DIR}








