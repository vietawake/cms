#!/bin/bash

IP=$1
#connect jenkins server to production server

ssh-keygen -f prod
cp prod /opt/prod
cat prod.pub | ssh root@$IP "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"

#install docker jenkins server and production server
scp -i /opt/prod production.sh root@$IP:~/production.sh
ssh -i /opt/prod root@$IP "sudo bash ~/production.sh"

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
apt install docker-compose

#install jenkins
sudo apt install openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
sudo ufw allow 8080

# install login to docker hub
sudo apt install gnupg2 pass

sudo echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

cat /var/lib/jenkins/secrets/initialAdminPassword