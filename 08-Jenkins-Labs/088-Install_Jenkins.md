# Steps to Install Jenkins as a Container on EC2 Instance

1- Create the EC2 Instance and open Port "8080" on It.
2- SSH to this EC2
3- Install Docker on it.
4- Run the Command:
    $sudo docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
5- In the Browser: To access Jenkins
    http://18.184.164.199:8080/
6- Exec the Container and then cat the pass for the InitialPassword

