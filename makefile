COMPOSE=docker-compose -f srcs/docker-compose.yaml

all: build

run: 
	${COMPOSE} up -d

build:
	${COMPOSE} build

# man_run:
# 	docker build -t nginx_man_i srcs/requirements/nginx
# 	docker run -it -p 443:443 --name nginx_man nginx_man_i

# man_stop:
# 	docker stop nginx_man
# 	docker container rm -f nginx_man

down:
	${COMPOSE} down

prune:
	docker system prune

clean:
	${COMPOSE} down -v --rmi all

fclean: clean prune