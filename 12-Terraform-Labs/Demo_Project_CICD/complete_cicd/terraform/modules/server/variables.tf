//Reference VPC from original main.tf
variable "vpc_id" {
    description = "this is the vpc-id from the original main.tf"
}

variable "my_local_ip" {
  description = "This var has the value of my macbook's ip"
  default = "156.201.93.144/32"
}

//Set the prefix of Environment
variable "env_prefix" {
  description = "this var has the value of the environment we are going to provision infrastructure in"
  default = "dev"
  type = string
}

//This Var has a list of AZs
variable "availability_zones" {
  description = "this var has the list values of AZs"
  default = ["eu-central-1a"]
  type = list(string)
}

variable "instance_type" {
  description = "this is a list of instance types available"
  default = ["t2.micro"]
  type = list(string)
}

variable "subnet_id" {
  description = "this var has the value od subnet.id from subnet module"
}

variable "image_name" {
  description = "this var has the value of ec2 image"
  default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}
