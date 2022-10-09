## The Architecture is atteached as a screenShot

## NOTE: How to get the image owner in AWS:
   1- get the image id
   2- in the AMI use "public images"
   3- filter with your image-id
   4- get the image and owner

## VERY IMPORTANT
   if you try to ssh the ec2 and doesn't work => check your local ip:
      1- $curl ifconfig.me
      2- add this ip in "my_local_ip" variable in vars file

## VERY IMPORTANT
   if we create the key pair file dynamically then we won't have ".pem" file locally on the machine to ssh the ec2
     1- I will use my private key to ssh
     2- $ssh -i ~/.ssh/id_rsa ubuntu@18.195.52.166


## VERY IMPORTANT
   I want to install software on this EC2 not manually "in automated way"
       *Using "user_data" which is used to run commands on the EC2 once this instance is initiated*
       EX:
           user_data = <<EOF
                    #!/bin/bash
                    sudo apt update -y
                    sudo apt install docker.io -y
                    sudo systemctl start docker
                    sudo usermod -aG docker ubuntu
                    sudo systemctl restart docker
                    sudo docker run -d --name nginx -p 8080:80 nginx
               EOF

    This Script here inside the EC2 will install docker and run this nginx container in this EC2 Instance.

## VERY IMPORTANT
  *It's not recommended to use provisioners in Terraform* Use it only when you have no another choice
  Also terraform is not knowing what is in these scripts you are running. it doesn't know if these commands in script are successfully run or not.
  That's why we need to use Configuration Management tool like "Ansible" in order to install software and run commands on a Server.
  

## VERY IMPORTANT
  This is the link for Ready Modules list: https://registry.terraform.io/browse/modules


## ########################################################################################################################

## Modules
  1- outputs.tf => has all the output Definitions.
  2- variables.tf => has all the variables definitions.

1. Server Module => has EC2 Resource and needed Resources
2. Subnet Module => has Subnet Resource and all needed resources.


## ########################################################################################################################

## VERY VERY VER IMPORTANT
  If you aren't able to connect to EC2 from Terminal or the connect in AWS GUI:
     check my local ip => $curl ifconfig.me
     if it changed     => add it in "my_local_ip" var value in "terraform.tfvars" file.