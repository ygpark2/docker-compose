.PHONY: build pristine

build:
	gradle build -x test

pristine:
	git clean -fdx


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
	docker load -i docker-gogs-images.tar


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
	docker load -i docker-mongodb-images.tar


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
	docker load -i docker-pulsar-images.tar


up-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml up

down-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml down

rm-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml rm

ps-haproxy:
	docker-compose -f ./docker-compose.haproxy.yml ps

save-haproxy-images:
	docker save -o docker-haproxy-images.tar $(docker-compose --env-file conf/haproxy/env -f ./docker-compose.haproxy.yml config | awk '{if ($1 == "image:") print $2;}')

load-haproxy-images:
	docker load -i docker-haproxy-images.tar


# =========================================== KEPCO dril proxy ===================================================
up-kepco-dril-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.dril-proxy.yml up

down-kepco-dril-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.dril-proxy.yml down

rm-kepco-dril-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.dril-proxy.yml rm

ps-kepco-dril-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.dril-proxy.yml ps

save-kepco-dril-haproxy-images:
	docker save -o docker-kepco-dril-haproxy-images.tar $(docker-compose --env-file conf/haproxy/env -f ./docker-compose.haproxy.kepco.dril-proxy.yml config | awk '{if ($1 == "image:") print $2;}')

load-kepco-dril-haproxy-images:
	docker load -i docker-kepco-dril-haproxy-images.tar


# =========================================== KEPCO boho proxy ===================================================
up-kepco-boho-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.boho-proxy.yml up

down-kepco-boho-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.boho-proxy.yml down

rm-kepco-boho-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.boho-proxy.yml rm

ps-kepco-boho-haproxy:
	docker-compose -f ./docker-compose.haproxy.kepco.boho-proxy.yml ps

save-kepco-boho-haproxy-images:
	docker save -o docker-kepco-boho-haproxy-images.tar $(docker-compose --env-file conf/haproxy/env -f ./docker-compose.haproxy.kepco.boho-proxy.yml config | awk '{if ($1 == "image:") print $2;}')

load-kepco-boho-haproxy-images:
	docker load -i docker-kepco-boho-haproxy-images.tar


up-kepco-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.haproxy.kepco.dev.yml -f ./docker-compose.gogs.kepco.yml up

down-kepco-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.haproxy.kepco.dev.yml -f ./docker-compose.gogs.kepco.yml down

rm-kepco-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.haproxy.kepco.dev.yml -f ./docker-compose.gogs.kepco.yml rm

ps-kepco-gogs:
	docker-compose --env-file ./conf/gogs/env -f ./docker-compose.haproxy.kepco.dev.yml -f ./docker-compose.gogs.kepco.yml ps

save-kepco-gogs-images:
	docker save -o docker-kepco-gogs-images.tar $(docker-compose --env-file conf/haproxy/env -f ./docker-compose.haproxy.kepco.dev.yml -f ./docker-compose.gogs.kepco.yml config | awk '{if ($1 == "image:") print $2;}')

load-kepco-gogs-images:
	docker load -i docker-kepco-gogs-images.tar



up:
	docker-compose up

down:
	docker-compose down

ps:
	docker-compose ps

rm:
	docker-compose rm

# cat /path/to/sql/file \
#   | docker-compose exec -T service_name psql -U username -d database_name
