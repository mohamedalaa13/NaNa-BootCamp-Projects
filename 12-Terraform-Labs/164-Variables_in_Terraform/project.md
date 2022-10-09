## We need to create variables and assign there values
   1. Create Variable function:
        variable "dev_subnet1_cidr_block" {
           description = "this var has the value of dev-subnet1 cidr"
        }
   
   2. Use this Variable inside the resource function:
         cidr_block = var.dev_subnet1_cidr_block  // here we call this var inside this resource

   3. Add the value of this variable in the "terraform.tfvars" file where we have all variables values:
         dev_subnet1_cidr_block = "10.0.1.0/24"


## VERY IMPORTANT
  ## If we are using multiple vars files for "dev, staging, prod" and we need to pass a file while apply
     1. EX: "terraform-dev.tfvars"
                  $terraform apply -var-file terraform-dev.tfvars
       *So, here we can use same configurations with just changing vars in the environment we want*

## VERY IMPORTANT
   ## We can add a default value inside the variable function so that if we don't add a value in vars file it will take the default vaule
        variable "dev_subnet1_cidr_block" {
            description = "this var has the value of dev-subnet1 cidr"
            default = "10.0.1.0/24"
        }

## VERY IMPORTANT
  ## We can have a list of values for the variable
     EX: We have a list of CIDR Blocks for Subnets
     