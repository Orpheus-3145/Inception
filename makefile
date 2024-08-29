COMPOSE=docker-compose -f srcs/docker-compose.yaml

all: build

run: 
	${COMPOSE} up

build:
	${COMPOSE} build

down:
	${COMPOSE} down

prune:
	docker system prune

clean:
	${COMPOSE} down -v --rmi all

fclean: clean prune