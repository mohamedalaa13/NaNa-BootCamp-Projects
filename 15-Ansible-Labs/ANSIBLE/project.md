## NOTE
   once i install Ansible on One Machine "EX: my local machine" i don't need to install Ansible on remote servers.
   BUT: remote server need python so that i can run Ansible commands on them.
   BTW: python3 is already installed on Ubuntu EC2s.

## VERY IMPORTANT
   ## To verify that Ansible can connect to both EC2s
      1- Create hosts file with EC2s IPs and path to private_key file and the user.
              [aws] => is grouping these two servers
      2- run this command to ping the EC2s using Ansible:
          $ansible aws -i hosts -m ping

## VERY IMPORTANT
    We can group Variables for specific group
      EX: [aws:vars]
           ansible_ssh_private_key_file=~/.ssh/complete-cicd-key.pem
           ansible_user=ubuntu

   So, instead of adding these two values so many times we add them in [aws:vars]


## Configure host key check "Authorized key and known hosts" automatically
   1- Run this command on my local Machine:
          $ssh-keyscan -H 165.134.40.16 >> ~/.ssh/known_hosts     
      Here: I'm putting the details of this EC2 which has this public IP in the know_hosts file so that my local can authenticate this EC2
   
   2- Copy my local ~/.ssh/id_rsa.pub in the ~/.ssh/authorized_keys on the EC2 instance
        $ssh-copy-id ubuntu@165.134.40.16
      Here this commands copy the public key from my local to this EC2

## First PlayBook is to install nginx using apt package and start nginx service
   1- check "nginx-playbook.yaml"
   2- Run the playbook using this command:
        $ansible-playbook -i hosts nginx-playbook.yaml


## NOTE
    for each Ansible project add "ansible.cfg" configuration file
    EX: we disable checking known_hosts when running ansible commands


## VERY IMPORTANT
    1- to stop nginx
           in service:  => state: stopped     => this will stop nginx service 
    2- to uninstall nginx using ansible:
           in apt:   =>  state: absent     => it will uninstall nginx

## VERY IMPORTANT
     $ansible-galaxy      => a Registry where the code of collection is and used to access the Ansible Documentation
     $ansible-galaxy collection list    => to list all collections
     $ansible-galaxy collection install kubernetes.core       => to install the latest verion of this collection

## ####################################################################################################################################

## Variables NOTE:
   we can can give the value of variables in the command and not hard-code it in the playbook file
   EX:
      $ansible-playbook -i hosts deploy-node-app.yaml -e "remote_home_locatio=/home/ubuntu"
## VERY IMPORTANT
   We can create a vars file like "project-vars".
   We link this file to the playbook file using 
        vars_files:
           - project-vars



## ####################################################################################################################################
## VERY IMPORTANT:
  # #Module to modify files 
     blockinfile:                                       #blockinfile to add multiple lines
        path: /opt/nexus/bin/nexus.rc
        block: |
          run_as_user="nexus"

     lineinfile:
        path: /opt/nexus/bin/nexus.rc
        regexp: '^# BEGIN ANSIBLE MANAGED BLOCK'
        state: absent                                   #state: absent to remove this line


## #################################################################################################################################

## Use Dynamic Inventory
   1- configure Ansible to use inventory-plugin aws_ec2 in "ansible.cfg"
   2- Create inventory-plugin for ec2 => "inventory_aws_ec2.yaml"
   3- Test this Inventory-plugin:
       $ansible-inventory -i inventory_aws_ec2.yaml --list
          Will get all data of all servers in this Region in the plugin file "eu-central-1"