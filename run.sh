#! /usr/bin/bash

docker run -dit --name="ta-mysql" --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=bolkur1 ta-mysql
docker run -dit --name="ta-apache" -p 9090:80 ta-apache

if [ ! "$(docker network ls | grep ta-network)" ]; then
  echo "Creating network 'ta-network'."
  docker network create ta-network
else
  echo "Network 'ta-network' already exists."
fi

docker network connect ta-network ta-mysql
docker network connect ta-network ta-apache