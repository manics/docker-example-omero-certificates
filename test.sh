#!/bin/sh
set -eu

docker-compose -f docker-compose.test.yml -f docker-compose.yml rm -fs
docker-compose -f docker-compose.test.yml -f docker-compose.yml build
docker-compose up -d
./wait_for_login.sh
docker-compose -f docker-compose.test.yml -f docker-compose.yml run test
