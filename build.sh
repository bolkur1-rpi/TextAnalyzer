#! /usr/bin/bash

docker build -t -f mysql ./mysql-dockerfile
docker build -t -f mysql ./apache-dockerfile