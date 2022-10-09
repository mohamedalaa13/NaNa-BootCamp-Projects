## We want to run docker-compose from jenkins-pipeline on EC2

## 1- Install Docker-compose on the EC2

    This is the doc: https://linuxhostsupport.com/blog/how-to-install-and-configure-docker-compose-on-ubuntu-20-04/

## 2- Create docker-compose.yaml
    
    docker-compose.yaml is created

## 3- Adjust jenkinsfile to run docker-compose on the EC2

    1- Copy "docker-compose.yaml" from the repo into the EC2:
           {sh 'scp docker-compose.yaml ubuntu@ec2-3-120-159-168.eu-central-1.compute.amazonaws.com:/home/ubuntu'}
       This step will secure copy the file to this path "/home/ubuntu" on my EC2 Instance

    2- Define the docker-compose command:
         { def deckerComposeCMD = "docker-compose -f docker-compose.yaml up --detach"  }

    3- Use the "deckerComposeCMD" inside the ssh command:
         { sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-3-120-159-168.eu-central-1.compute.amazonaws.com ${deckerComposeCMD}" }

    4- This is the Build:
         http://localhost:2020/job/EC2_Server/14/console

### ##################################################################################################################################

## Create a Shell Script
   
1- Create the script.sh file and put in it the commands "server-script.sh"
2- call the script.sh in the pipeline: 
     def deckerComposeCMD = "bash ./server-script.sh"
3- Clone the script.sh from the repo to the EC2 Instance:
     sh 'scp server-script.sh ubuntu@ec2-3-120-159-168.eu-central-1.compute.amazonaws.com:/home/ubuntu'

4- This is the build:
     http://localhost:2020/job/EC2_Server/15/console

### ##################################################################################################################################

## Make the Image_Name dynamic not static "Variable"

   1- Pass the image_name as a param to the script.sh file:
        def deckerComposeCMD = "bash ./server-script.sh 139646/java-maven-app:$IMAGE_NAME"
   2- Export this param in the script.sh: *This env var will be on the EC2 so that the docker-compose.yaml can read it*
        export IMAGE = $1
   3- Use this "IMAGE" in the docker-compose.yaml file:
        image: $IMAGE

   4- This is the build:
        http://localhost:2020/job/EC2_Server/17/console


### ##################################################################################################################################

## You need to commit changes to the repo as before by adding stage "commit version update"
## VERY IMPORTANT:
   This is the final build and CICD:
      http://localhost:2020/job/EC2_Server/24/console