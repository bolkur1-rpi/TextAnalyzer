#! /usr/bin/bash

docker run -dit --name="ta-mysql" -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root ta-mysql
docker run -dit --name="ta-apache" -p 9090:80 ta-apache