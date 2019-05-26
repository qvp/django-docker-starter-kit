#!/bin/bash

function manage_app () {
    python /app/manage.py makemigrations
    python /app/manage.py migrate
}

function start_development() {
    # use django runserver as development server here.
    manage_app
    python /app/manage.py runserver 0.0.0.0:8000
}

function start_production() {
    # use gunicorn for production server here
    manage_app
    gunicorn /app/settings.wsgi -w 4 -b 0.0.0.0:8000 --chdir=/app --log-file -
}

if [ ${PRODUCTION} == "false" ]; then
    # use development server
    start_development
else
    # use production server
    start_production
fi