#!/bin/bash

TECH=$1
COMPOSE_DIR=$(dirname "$0")

case "$TECH" in
  postgres)
    docker-compose -f "$COMPOSE_DIR/docker-compose-postgres.yaml" up -d
    ;;
  mongodb)
    docker-compose -f "$COMPOSE_DIR/docker-compose-mongodb.yaml" up -d
    ;;
  redis)
    docker-compose -f "$COMPOSE_DIR/docker-compose-redis.yaml" up -d
    ;;
  *)
    echo "❌ Unknown tech: $TECH"
    echo "Usage: ./start-tech.sh [postgres|mongodb|redis]"
    exit 1
    ;;
esac
