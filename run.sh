#! /usr/bin/bash

docker run -dit --name="ta-mysql" -p --restart always 3306:3306 -e MYSQL_ROOT_PASSWORD=bolkur1 ta-mysql
docker run -dit --name="ta-apache" -p 9090:80 ta-apache

docker network create ta-network
docker network connect ta-network ta-mysql
docker network connect ta-network ta-apache