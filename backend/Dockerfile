FROM python:3

RUN useradd -m -d /app backend
RUN apt-get update
RUN apt-get -y install gettext-base


USER backend
WORKDIR /app

# RUN wget -qq https://github.com/timoguic/acit4640-py-mysql/archive/refs/heads/master.zip -O /tmp/source.zip && unzip /tmp/source.zip && cp -r acit4640-py-mysql-master/backend /app/src && rm -rf acit4640-py-mysql-master

COPY ./ /app/src

RUN python -m pip install -r /app/src/requirements.txt

WORKDIR /app/src

# create backend.conf
COPY backend_template.conf /app/src
COPY backend_create.sh /app/src
USER root
RUN chmod +x ./backend_create.sh

# use wait-for-it.sh
COPY wait-for-it.sh wait-for-it.sh 
USER root
RUN chmod +x wait-for-it.sh

RUN chown -R backend /app

USER backend
EXPOSE 8050

ENTRYPOINT [ "/bin/bash", "/app/src/backend_create.sh" ]
# CMD ["./wait-for-it.sh" , "-h", "db", "-p", "3306", "-s", "--" , "/app/.local/bin/gunicorn", "wsgi:app", "-b", "0.0.0.0:8050"]
CMD /app/src/wait-for-it.sh -h ${MYSQL_HOST} -p 3306 -t 0 -- /app/.local/bin/gunicorn wsgi:${BACKEND_HOST} -b 0.0.0.0:${BACKEND_PORT}
