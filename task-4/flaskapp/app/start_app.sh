#!/bin/bash

# dockerize -wait tcp://${DATABASE_HOST}:3306 -timeout 30s

# python manage.py migrate

# python manage.py runserver 9003 # use runserver in dev for instant reload
# gunicorn nimab_website.wsgi:application --bind 0.0.0.0:9003 --workers 2

python hello.py