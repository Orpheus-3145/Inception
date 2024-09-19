COMPOSE=docker compose -f srcs/docker-compose.yaml

all: build

run: 
	${COMPOSE} up -d

build:
	${COMPOSE} build

run_scratch:
	sudo rm -rf ${HOME}/data/db
	sudo rm -rf ${HOME}/data/wp
	mkdir -p ${HOME}/data/db
	mkdir -p ${HOME}/data/wp
	$(COMPOSE) up -d --no-deps --build --force-recreate

down:
	${COMPOSE} down

prune:
	docker system prune

clean:
	${COMPOSE} down -v --rmi all

fclean: clean prune