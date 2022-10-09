## Create a pipeline to deploy to EC2

 1- Install SSH Plugin in Jenkins "ssh agent plugin"
 2- Create ssh credential in jenkins dashboard and put the .pem file in it so that you can ssh to the ec2
         check this: http://localhost:2020/credentials/store/system/domain/_/credential/ec2-server-key/update

## Very Important
 3- This Link: http://localhost:2020/job/Java_Maven_App/pipeline-syntax/ you can choose what you want to write in jenkins file and it will generate the syntax
 EX: "sshagent: SSH Agent" => sshagent(['ec2-server-key']) {
                                    // some block
                                  } 

 4- Create Jenkinsfile: https://gitlab.com/mohamedalaa13/java-maven-app/-/blob/feature/payment/Jenkinsfile
 5- Build the Pipeline: http://localhost:2020/job/EC2_Server/6/console


 ###### ###########################################################################################################

 ## VERY IMPORTANT ## CICD Deploy to EC2 using jenkins-shared-library

 this is the jenkinsfile: https://gitlab.com/mohamedalaa13/java-maven-app/-/blob/jenkins-shared-lib/Jenkinsfile
 this is the build: http://localhost:2020/job/EC2_Server/13/