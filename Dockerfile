FROM ubuntu:16.04
MAINTAINER Przemek Kamiński <cgenie@gmail.com>

ENV WORKDIR /code

ADD ./requirements.txt /requirements.txt

RUN apt-get update && apt-get -y upgrade && apt-get install -y curl python-pip python-psycopg2
RUN pip install -r /requirements.txt

WORKDIR ${WORKDIR}

#CMD DJANGO_SETTINGS_MODULE=django_hstore_field_fail.settings python failing.py
CMD ./run.sh
