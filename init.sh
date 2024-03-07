#!/bin/bash

echo "# docker-Orchestration-multiple-containers link containers to nginx proxy for masking ip"
echo "How to use this tool:"
echo "\$ su - username"
echo "\$ git clone https://github.com/hanifr/docker-Orchestration-multiple-containers.git"
echo "\$ cd nginxproxy"

# Check if docker-compose is available
if ! command -v docker-compose &> /dev/null; then
    echo "docker-compose is not available, installing..."
    sudo apt update
    sudo apt install -y docker-compose
else
    echo "docker-compose is available."
fi

# Start the nginx proxy
echo "Starting the nginx proxy..."
cd nginxproxy || exit
docker-compose up -d
cd ..

# Create the nginx-proxy network
echo "Creating the nginx-proxy network..."
docker network create nginx-proxy

# Set up Node-RED
echo "Setting up Node-RED..."
cd node-red || exit
nano docker-compose.yml
echo "Change the domain address and related details in docker-compose.yml"
read -p "Press Enter when you're done..."
docker-compose up -d
cd ..

# Set up Grafana and MySQL
echo "Setting up Grafana and MySQL..."
cd grafana-mysql || exit
nano docker-compose.yml
echo "Change the domain address and related details in docker-compose.yml"
read -p "Press Enter when you're done..."
docker-compose up -d
cd ..

echo "Further reading on proxy setup: https://hub.docker.com/r/jwilder/nginx-proxy"