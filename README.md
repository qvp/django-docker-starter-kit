# Django Docker Starter Kit
This starter kit helps you quickly set up a working environment for development and production django
application with Docker, PostgreSQL, Nginx, Gunicorn.

## Installation
Run in terminal:
```bash
git clone https://github.com/qvp/django-docker-starter-kit YOUR_DIR_APP_NAME
```

## Setup
Edit requirements.txt in application directory. Then run in terminal:
```bash
make startproject
```

## Run
Run in terminal:
```bash
make dev
```

## Table of all available `make` commands:
| Command             | Description                             |
|---------------------|-----------------------------------------|
| `make startproject` | Create new django project               |
| `make dev`          | Run django app with DEV environment     |
| `make prod`         | Run django app with PROD environment    |
| `make stop-dev`     | Stop django app with DEV environment    |
| `make stop-prod`    | Stop django app with PROD environment   |
| `make web`          | Connect to django app container via SSH |
| `make nginx`        | Connect to Nginx container via SSH      |
| `make db`           | Connect to PostgreSQL container via SSH |
| `make build-dev`    | Build containers in DEV environment     |
| `make build-prod`   | Build containers in PROD environment    |