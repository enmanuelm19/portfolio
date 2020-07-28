build:
	docker-compose -p portfolio build
rebuild:
	docker-compose  -p portfolio build --no-cache
status:
	docker-compose -p portfolio ps
network_status:
	docker network ls
volume_status:
	docker volume ls
run_all:
	docker-compose -p portfolio up -d
run:
	docker-compose -p portfolio up -d rails postgresql
run_mailcatcher:
	docker-compose -p portfolio up -d mailcatcher
start_all:
	@docker-compose -p portfolio up --no-recreate
start:
	@docker-compose -p portfolio up -d --no-recreate  rails postgresql
stop:
	@docker-compose -p portfolio stop
clean:
	@docker-compose -p portfolio down
clean_volumes:
	@docker-compose -p portfolio down -v
ssh_rails:
	@docker exec -it --user root portfolio_rails_1 /bin/bash
ssh_postgresql:
	@docker exec -it --user root portfolio_postgresql_1 /bin/bash
