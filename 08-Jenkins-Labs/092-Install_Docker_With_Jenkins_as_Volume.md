

# How to install Docker inside the Jenkins Container to run Docker Commands inside Jenkins
    1- We have Docker installed on the EC2 that has "Jenkins_Container".
    2- We need to mount the Volume of this Docker installed into inside the "Jenkins_Container".

# ####################################################################################################


# Steps
1- Inside the EC2
    $docker volume ls    => i will find the volume of older Jenkins_Container "jenkins_home" and i will use it to not lose any previous data

2- Create the new Container
    $sudo docker run -p 8080:8080 -p 50000:50000 -d \
> -v jenkins_home:/var/jenkins_home \                      # the previous jenkins_container volume
> -v /var/run/docker.sock:/var/run/docker.sock \           # the docker volume
> -v $(which docker):/usr/bin/docker \                     # the docker runtime
> jenkins/jenkins:lts

3- http://18.156.34.162:8080/

4- To test that the New "Jenkins_Container" has docker in it
     $sudo docker exec -it cad0039db98b bash
     $docker

5- To be able to run docker commands inside the "Jenkins_Container"
   $sudo docker exec -it -u 0 cad0039db98b bash          => Enter as a Root User
   $chmod 666 /var/run/docker.sock