#!/bin/bash

cd /code

while 1
do
    echo "$(date) -- waiting for postgres"
    response=$(psql -U postgres -t -c "select now()" postgres)

    if [ $? == 0 ]; then
        break
    else
        sleep 1
    fi
done
echo "$(date) -- connected to postgres"

DJANGO_SETTINGS_MODULE=django_hstore_field_fail.settings ./manage.py migrate
DJANGO_SETTINGS_MODULE=django_hstore_field_fail.settings python failing.py
