# Django Docker Starter Kit
This starter kit helps you quickly set up a working environment for development and production django
application with Docker, PostgreSQL, Nginx, Gunicorn.

## Installation
Run in terminal:
```bash
git clone https://github.com/qvp/django-docker-starter-kit YOUR_DIR_APP_NAME
```

## Setup
* Edit requirements.txt in application directory.
* Edit ./.env, set COMPOSE_PROJECT_NAME=YOUR_APP_NAME

Then run in terminal:
```bash
make project
```

## Run
Run in terminal:
```bash
make dev
```
The project is available at `http://localhost:8000`

## Production
On your production server, run:
```bash
make prod
```
This command will launch the project in production mode with Nginx and Gunicorn.
The project will be available at your domain. Nginx settings are available at
'./docker/nginx/nginx.conf'

## Table of available commands:
| Command             | Description                             |
|---------------------|-----------------------------------------|
| `make project`      | Create new django project               |
| `make dev`          | Run django app with DEV environment     |
| `make prod`         | Run django app with PROD environment    |
| `make stop`         | Stop all application containers         |
| `make build`        | Build all application containers        |
| `make ssh-web`      | Connect to Django app container via SSH |
| `make ssh-nginx`    | Connect to Nginx container via SSH      |
| `make ssh-db`       | Connect to PostgreSQL container via SSH |