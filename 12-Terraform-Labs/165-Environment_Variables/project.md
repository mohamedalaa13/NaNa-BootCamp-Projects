## We need to remove hard-coded credentials from provider in main.tf as we are going to push the code to a git repo
    1. If i have configured my AWS Credentials using => $aws configure
         then these credentials will be saved in this file "~/.aws/credentials" and Terraform will read the Credentials from this file automatically.


## VERY IMPORTANT
   ## We can define terraform env variables from terminal
     EX:  $export TF_VAR_availability_zone_a="eu-central-1a"      => TF_VAR_"env_var_name"
     Usage: IN MAIN.TF
1. variable availability_zone_a {}
2. in resource function => availability_zone = var.availability_zone_a