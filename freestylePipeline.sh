#! /usr/bin/bash

docker build . -t sample-node-app:$GIT_COMMIT
docker image ls
docker tag sample-node-app:$GIT_COMMIT anas1243/sample-node-app:$GIT_COMMIT
docker login -u $USERNAME -p $PASSWORD
docker push anas1243/sample-node-app:$GIT_COMMIT
docker run -d -it -p 3000:3000 anas1243/sample-node-app:$GIT_COMMIT
