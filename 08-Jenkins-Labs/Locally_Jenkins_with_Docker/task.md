## Steps of Running Docker with Jenkins


## 1-Create Docker Network
   $docker network create nana-jenkins

## 2-Run the docker:dind Docker
   $docker run --name jenkins-docker --rm --detach \
  --privileged --network nana-jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2 

## 2-Build the Dockerfile attached
   $docker build -t nana-jenkins:v1 .

## 3-Create a Container
   $docker run --name jenkins-blueocean --restart=on-failure --detach \
  --network nana-jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 2020:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  nana-jenkins:v1

## #############################################################################################

Check this Tutorial: https://www.jenkins.io/doc/book/installing/docker/