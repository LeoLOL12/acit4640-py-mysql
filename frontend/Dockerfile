FROM nginx

RUN apt-get -y update && apt-get -y install wget unzip

RUN mkdir /app
RUN wget -qq https://github.com/timoguic/acit4640-py-mysql/archive/refs/heads/master.zip -O /tmp/source.zip && unzip /tmp/source.zip && cp -r acit4640-py-mysql-master/frontend /app/src && rm -rf acit4640-py-mysql-master


WORKDIR /app/src
# Copy index.html to correct location
RUN cp index.html /usr/share/nginx/html

# nginx templates
RUN mkdir /etc/nginx/templates
COPY default.conf.template /etc/nginx/templates


