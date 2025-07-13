#!/bin/bash
SCRIPT_DIR=$(dirname "$0")

docker-compose -f "$SCRIPT_DIR/docker-compose-postgres.yaml" down -v
docker-compose -f "$SCRIPT_DIR/docker-compose-mongodb.yaml" down -v
docker-compose -f "$SCRIPT_DIR/docker-compose-redis.yaml" down -v

docker ps -a