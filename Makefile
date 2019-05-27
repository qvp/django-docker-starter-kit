dev:
	docker-compose -f docker/docker-compose.yml -f docker/docker-compose.override.yml up

prod:
	export COMPOSE_HTTP_TIMEOUT=120
	docker-compose -f ./docker/docker-compose.yml -f docker/docker-compose.override.yml -f ./docker/docker-compose.prod.yml up

stop:
	export COMPOSE_HTTP_TIMEOUT=120
	docker-compose -f ./docker/docker-compose.yml -f docker/docker-compose.override.yml -f ./docker/docker-compose.prod.yml stop

ssh-nginx:
	docker-compose exec nginx bash

ssh-web:
	docker-compose exec web bash

ssh-db:
	docker-compose exec db bash

build:
	cp ./application/requirements.txt ./docker/django/requirements.txt
	docker-compose -f ./docker/docker-compose.yml -f docker/docker-compose.override.yml -f ./docker/docker-compose.prod.yml build

project:
	cp ./application/requirements.txt ./docker/django/requirements.txt
	make build
	sudo docker-compose -f docker/docker-compose.startproject.yml run --rm web django-admin startproject settings .