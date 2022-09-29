.PHONY: build pristine

build:
	gradle build -x test

pristine:
	git clean -fdx

up:
	docker-compose -f ./docker-compose.yml up --build --remove-orphans

upp:
	docker-compose -f ./docker-compose.yml -f ./docker-compose.pulsar.yml up --build --remove-orphans


upd-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.gogs.yml up -d

up-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.gogs.yml up

down-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.gogs.yml down

rm-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.gogs.yml rm

ps-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.gogs.yml ps

save-gogs-images:
	docker save -o docker-gogs-images.tar $(docker-compose --env-file conf/gogs/env -f ./docker-compose.gogs.yml config | awk '{if ($1 == "image:") print $2;}')

load-dgogsev-images:
	docker load docker-gogs-images.tar


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

save-mongodb-images:
	docker save -o docker-mongodb-images.tar $(docker-compose --env-file conf/mongodb/env -f ./docker-compose.mongodb.yml config | awk '{if ($1 == "image:") print $2;}')

load-mongodb-images:
	docker load docker-mongodb-images.tar


up-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml up

down-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml down

rm-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml rm

ps-pulsar:
	docker-compose -f ./docker-compose.pulsar.yml ps

save-pulsar-images:
	docker save -o docker-pulsar-images.tar $(docker-compose --env-file conf/pulsar/env -f ./docker-compose.pulsar.yml config | awk '{if ($1 == "image:") print $2;}')

load-pulsar-images:
	docker load docker-pulsar-images.tar


up-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml up

down-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml down

rm-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml rm

ps-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml ps

save-haproxy-images:
	docker save -o haproxy-pulsar-images.tar $(docker-compose --env-file conf/haproxy/env -f ./docker-compose.haproxy.yml config | awk '{if ($1 == "image:") print $2;}')

load-haproxy-images:
	docker load docker-haproxy-images.tar

down:
	docker-compose down

ps:
	docker-compose ps

# cat /path/to/sql/file \
#   | docker-compose exec -T service_name psql -U username -d database_name
