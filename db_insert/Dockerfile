FROM python:3

# Install mysql-client
RUN apt-get update
RUN apt-get install -y default-mysql-client

WORKDIR /tmp

COPY wait-for-it.sh wait-for-it.sh 
USER root
RUN chmod +x wait-for-it.sh

# Script to insert insert.sql into the db
COPY insert.sh insert.sh
# COPY insert.sql insert.sql
RUN chmod +x insert.sh


CMD /tmp/wait-for-it.sh -h ${BACKEND_HOST} -p ${BACKEND_PORT} -t 0 -- /tmp/insert.sh