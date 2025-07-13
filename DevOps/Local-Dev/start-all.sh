#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

bash "$SCRIPT_DIR/start-tech.sh" postgres
bash "$SCRIPT_DIR/start-tech.sh" mongodb
bash "$SCRIPT_DIR/start-tech.sh" redis

docker ps -a