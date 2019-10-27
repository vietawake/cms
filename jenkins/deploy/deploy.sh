#!/bin/bash
IP=$1

scp -i /opt/prod ./jenkins/deploy/publish root@$IP:/tmp/publish
scp -i /opt/prod -prq docker root@$IP:~/SUM_CMS
scp -i /opt/prod -prq sources root@$IP:~/SUM_CMS
scp -i /opt/prod -prq docker-compose.yml root@$IP:~/SUM_CMS
ssh -i /opt/prod root@$IP "sudo bash /tmp/publish"