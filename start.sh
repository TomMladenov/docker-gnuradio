#!/bin/bash



if [ $# -ne 1 ]
then
    echo "You must provide 1 argument only"
    echo "Usage:"
    echo "      ./start.sh /path/to/mountfolder"
    exit -1
else
    echo "Starting and mounting $1 at container path $container_path"
    MOUNT_DIR_CONTAINER=$1 docker-compose up
    docker-compose down --remove-orphans
    sleep 2
    docker container prune -f
    docker ps -a
fi


