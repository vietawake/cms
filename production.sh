#!/bin/bash

#install docker and docker compose
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
apt install docker-compose

# install login to docker hub
sudo apt install gnupg2 pass