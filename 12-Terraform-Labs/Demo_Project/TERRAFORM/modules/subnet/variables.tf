//Variable with subnet cidr value "10.0.1.0/24"
variable "myapp_subnet1_cidr_block" {
  description = "this var has the value of myapp-subnet1 cidr"
  default = "10.0.1.0/24"
}

//This Var has a list of AZs
variable "availability_zones" {
  description = "this var has the list values of AZs"
  type = list(string)
}

//Set the prefix of Environment
variable "env_prefix" {
  description = "this var has the value of the environment we are going to provision infrastructure in"
  type = string
}

//Reference VPC from original main.tf
variable "vpc_id" {
    description = "this is the vpc-id from the original main.tf"
}