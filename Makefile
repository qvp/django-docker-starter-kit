dev:
	docker-compose -f docker/docker-compose.yml -f docker/docker-compose.override.yml up

prod:
	export COMPOSE_HTTP_TIMEOUT=120
	docker-compose -f ./docker/docker-compose.yml -f docker/docker-compose.override.yml -f ./docker/docker-compose.prod.yml up

stop-dev:
	docker-compose -f docker/docker-compose.yml -f docker/docker-compose.override.yml stop

stop-prod:
	export COMPOSE_HTTP_TIMEOUT=120
	docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml stop

nginx:
	docker exec -it application_nginx bash

web:
	docker exec -it application_web bash

db:
	docker exec -it application_db bash

build-prod:
	cp ./application/requirements.txt ./docker/django/requirements.txt
	docker-compose -f ./docker/docker-compose.yml -f docker/docker-compose.override.yml -f ./docker/docker-compose.prod.yml build

build-dev:
	cp ./application/requirements.txt ./docker/django/requirements.txt
	docker-compose -f docker/docker-compose.yml -f docker/docker-compose.override.yml build

startproject:
	cp ./application/requirements.txt ./docker/django/requirements.txt
	sudo docker-compose -f docker/docker-compose.yml -f docker/docker-compose.override.yml run web django-admin startproject settings .