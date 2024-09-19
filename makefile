COMPOSE=docker compose -f srcs/docker-compose.yaml
VOL_WP_PATH = ${HOME}/data/wp
VOL_DB_PATH = ${HOME}/data/db

all: build

run: 
	@mkdir -p $(VOL_WP_PATH)
	@mkdir -p $(VOL_DB_PATH)
	@${COMPOSE} up -d

build:
	@mkdir -p $(VOL_WP_PATH)
	@mkdir -p $(VOL_DB_PATH)
	@${COMPOSE} build

run_scratch:
	@rm -rf $(VOL_WP_PATH)
	@rm -rf $(VOL_DB_PATH)
	@mkdir -p $(VOL_WP_PATH)
	@mkdir -p $(VOL_DB_PATH)
	@$(COMPOSE) up -d --no-deps --build --force-recreate

re: fclean run
	
down:
	@${COMPOSE} down

prune:
	@docker system prune -a

clean:
	@${COMPOSE} down -v --rmi all

fclean: clean prune

.PHONY: all run build run_scratch re down clean fclean