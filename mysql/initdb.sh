#!/bin/bash

source <(grep APP_NAME ../.env)
source <(grep PASSWORD ../.env)

MYSQL_INSTANCE=`docker ps --format "{{.Names}}" | grep mysql`

docker exec -e MYSQL_PWD=${MYSQL_ROOT_PASSWORD} ${MYSQL_INSTANCE} mysql -uroot -e "CREATE DATABASE guacamole CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"
docker exec -e MYSQL_PWD=${MYSQL_ROOT_PASSWORD} ${MYSQL_INSTANCE} mysql -uroot -e "CREATE USER 'guacamole'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
docker exec -e MYSQL_PWD=${MYSQL_ROOT_PASSWORD} ${MYSQL_INSTANCE} mysql -uroot -e "GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole.* TO 'guacamole'@'%';"
docker exec -e MYSQL_PWD=${MYSQL_ROOT_PASSWORD} ${MYSQL_INSTANCE} mysql -uroot -e "FLUSH PRIVILEGES;"

docker cp initdb.sql ${MYSQL_INSTANCE}:/tmp/

docker exec -e MYSQL_PWD=${MYSQL_ROOT_PASSWORD} ${MYSQL_INSTANCE} mysql -uroot -e "SOURCE /tmp/initdb.sql;" guacamole
