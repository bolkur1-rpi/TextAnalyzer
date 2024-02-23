#! /usr/bin/bash

docker build -t ta-mysql . -f mysql
docker build -t ta-apache . -f apache