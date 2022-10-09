## To Create Stage "Provision EC2 Server"

## 1- Create Key-Pair to ssh into EC2
   1. Create a "key-pair" in AWS Console => "complete-cicd-key.pem"
   2. In Jenkins DashBoard Credentials create ssh credentials to use this key-pair to ssh EC2 Server


## 2- Install Terraform inside jenkins container
   1. Exec the Jenkins Container as a Root => -u 0
   2. Run these Commands to install Terraform on Debian os
           $curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
           $apt-get install software-properties-common
           $apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
           $apt-get update && apt-get install terraform
           $terraform -v


## 3- Add Terraform Configuration Files in the code
   1. Install docker-compose in the EC2 using "entry-script.sh"

## 4- Using Terraform in "Provision EC2 Server" stage
   1. Add the AWS("access_key" AND "secret_key") in jenkins dashboard credentials
   2. use them in jenkinsfile as env vars
   3. add this script in the stage to run terraform commands:
         script {
                    dir('TERRAFORM') {
                        sh "terraform init"
                        sh "terraform apply --auto-approve"
                    }
                }
   
## 5- Deploy Stage in Jenkinsfile
   1. Configure using the newly create EC2 public Ip
   2. wait for ec2 server to be fully intialized 


## This is the jenkins build 
    http://localhost:2020/job/Complete_CICD/9/console


## We need to share the "State File" of Terraform so that it will be updated for all the Team Members
   1. Configure a remote storage to have this file in it.
   2. Create backend "s3" bucket to store the State File in it and be shared.
   3. to connect Locally to this state file:
        $terraform init
        $terraform state list

    