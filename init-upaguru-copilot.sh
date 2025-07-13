#!/bin/bash

echo '📁 Creating project structure for upaguru-copilot...'

# Root files
touch pom.xml README.md package.json .env

# Java source directories
mkdir -p src/main/java/com/upaguru/copilot/controller
mkdir -p src/main/java/com/upaguru/copilot/service
mkdir -p src/main/java/com/upaguru/copilot/service/impl
mkdir -p src/main/java/com/upaguru/copilot/broker
mkdir -p src/main/java/com/upaguru/copilot/broker/impl
mkdir -p src/main/java/com/upaguru/copilot/persistence
mkdir -p src/main/java/com/upaguru/copilot/persistence/impl
mkdir -p src/main/java/com/upaguru/copilot/persistence/jpa
mkdir -p src/main/java/com/upaguru/copilot/dtos
mkdir -p src/main/java/com/upaguru/copilot/entity
mkdir -p src/main/java/com/upaguru/copilot/config
mkdir -p DevOps/Local-Dev

# Docker Compose files and scripts
touch DevOps/Local-Dev/docker-compose-postgres.yaml
touch DevOps/Local-Dev/docker-compose-mongodb.yaml
touch DevOps/Local-Dev/docker-compose-redis.yaml
touch DevOps/Local-Dev/start-tech.sh
touch DevOps/Local-Dev/start-all.sh
touch DevOps/Local-Dev/stop-all.sh

echo '✅ Project structure created successfully.'