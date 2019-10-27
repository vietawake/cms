#!/bin/bash
IP=$1

scp -i /opt/prod ./jenkins/deploy/publish root@$IP:/tmp/publish
scp -i /opt/prod -prq sources/ root@$IP:~/
scp -i /opt/prod -prq docker-compose.yml root@$IP:~/
ssh -i /opt/prod root@$IP "sudo bash /tmp/publish"