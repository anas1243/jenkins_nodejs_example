#! /usr/bin/bash

# run master container
docker run -d --name jenkins_master -p 8080:8080 -p 5000:5000 -v jenkins:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock --restart always anas1243/jenkins-with-docker

# run agents container
docker run -d --name agent-01 -u root -e JENKINS_AGENT_SSH_PUBKEY="$(cat id_rsa.pub)" \
    -v /var/run/docker.sock:/var/run/docker.sock --restart always anas1243/jenkins-ssh-agent-with-docker
