#!/usr/bin/env bash

set -e

script_path=$(cd $(dirname $0) ; pwd -P)
script_path_root="${script_path}/"

docker build \
  -t vkill/postgres_mysql_fdw:11.1-alpine \
  -f "${script_path_root}../mysql_fdw/Dockerfile" \
  "${script_path_root}../mysql_fdw"

docker build \
  -t vkill/postgres_mysql_fdw:11.1 \
  -f "${script_path_root}../mysql_fdw/Dockerfile.debian" \
  "${script_path_root}../mysql_fdw"
