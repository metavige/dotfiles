#!/bin/bash

docker ps -aqf status=exited | xargs docker rm
docker images -qf dangling=true | xargs docker rmi
