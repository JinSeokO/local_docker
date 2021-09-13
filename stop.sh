#!/bin/bash

CURRENT_PATH=$(cd $(dirname "$0") && pwd -P)/docker-compose.yml
echo $CURRENT_PATH2

docker-compose -f $CURRENT_PATH down
