.PHONY: build pristine

build:
	gradle build -x test

pristine:
	git clean -fdx

up:
	docker-compose -f ./docker-compose.yml up --build --remove-orphans

upp:
	docker-compose -f ./docker-compose.yml -f ./docker-compose.pulsar.yml up --build --remove-orphans

up-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml up

down-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml down

rm-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml rm

down:
	docker-compose down

ps:
	docker-compose ps

# cat /path/to/sql/file \
#   | docker-compose exec -T service_name psql -U username -d database_name