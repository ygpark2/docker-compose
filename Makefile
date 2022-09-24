.PHONY: build pristine

build:
	gradle build -x test

pristine:
	git clean -fdx

up:
	docker-compose -f ./docker-compose.yml up --build --remove-orphans

upp:
	docker-compose -f ./docker-compose.yml -f ./docker-compose.pulsar.yml up --build --remove-orphans


upd-mongodb:
	docker-compose -f ./docker-compose.mongodb.yml up -d

up-mongodb:
	docker-compose -f ./docker-compose.mongodb.yml up

down-mongodb:
	docker-compose -f ./docker-compose.mongodb.yml down

rm-mongodb:
	docker-compose -f ./docker-compose.mongodb.yml rm

ps-mongodb:
	docker-compose -f ./docker-compose.mongodb.yml ps


up-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml up

down-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml down

rm-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml rm

ps-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml ps



up-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml up

down-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml down

rm-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml rm

ps-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml ps


down:
	docker-compose down

ps:
	docker-compose ps

# cat /path/to/sql/file \
#   | docker-compose exec -T service_name psql -U username -d database_name