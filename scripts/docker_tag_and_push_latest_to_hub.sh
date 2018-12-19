#!/usr/bin/env bash

set -e

docker pull vkill/postgres_mysql_fdw:11.1-alpine
docker tag vkill/postgres_mysql_fdw:11.1-alpine vkill/postgres_mysql_fdw:latest
docker push vkill/postgres_mysql_fdw:latest
