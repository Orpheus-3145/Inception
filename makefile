COMPOSE=docker compose -f srcs/docker-compose.yaml
VOL_WP_PATH = ${HOME}/data/wp
VOL_DB_PATH = ${HOME}/data/db

SINGLE_SERV = ''

all: build

run:
	@mkdir -p $(VOL_WP_PATH)
	@mkdir -p $(VOL_DB_PATH)
	@${COMPOSE} up -d

run_s:
	@mkdir -p $(VOL_WP_PATH)
	@mkdir -p $(VOL_DB_PATH)
	@${COMPOSE} up -d $(SINGLE_SERV)

run_db:
	@$(MAKE) run_s SINGLE_SERV='mariadb'

run_nginx:
	@$(MAKE) run_s SINGLE_SERV='nginx'

run_wp:
	@$(MAKE) run_s SINGLE_SERV='wordpress'

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

clean:
	@${COMPOSE} down -v --rmi all

prune:
	@docker system prune -a
	@rm -rf $(VOL_DB_PATH)/*
	@rm -rf $(VOL_WP_PATH)/*

fclean: clean prune

.PHONY: all run build run_scratch re down clean fclean