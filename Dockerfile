FROM mysql
COPY ./docker-SQL /docker-entrypoint-initdb.d
EXPOSE 3306

FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update; apt dist-upgrade -y
RUN apt install apache2 php-mysql pip -y
RUN pip install mysql-connector-python
COPY ./html /var/www/html
WORKDIR /var/www/html
RUN ls
EXPOSE 80
ENTRYPOINT apache2ctl -D FOREGROUND