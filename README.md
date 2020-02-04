# docker-Orchestration-multiple-containers
link containers to nginx proxy for masking ip

How to use this tool

$ su - username

$ git clone https://github.com/hanifr/docker-Orchestration-multiple-containers.git

$ cd nginxproxy

$ docker-compose up -d

$ cd

$ docker network create nginx-proxy

$ cd node-red

$ sudo nano docker-compose.yml

change the domain address and related details

$ docker-compose up -d

$ cd grafana-mysql

change the domain address and related details

$ docker-compose up -d
