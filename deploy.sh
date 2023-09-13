#!/bin/bash

DOCKER_APP_NAME=jyp_docker

cd /home/ec2-user/jyp

EXIST_CONTAINER=$(docker ps | grep $DOCKER_APP_NAME-main)

if [ -z "$EXIST_CONTAINER" ]; then
	docker-compose -p ${DOCKER_APP_NAME} -f docker-compose.yml up -d --build

	echo "Build Complete ${DOCKER_APP_NAME}-main container"
fi

docker system prune -af
