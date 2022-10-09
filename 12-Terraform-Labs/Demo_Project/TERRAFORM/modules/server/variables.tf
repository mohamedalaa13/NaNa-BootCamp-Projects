//Reference VPC from original main.tf
variable "vpc_id" {
    description = "this is the vpc-id from the original main.tf"
}

variable "my_local_ip" {
  description = "This var has the value of my macbook's ip"
}

//Set the prefix of Environment
variable "env_prefix" {
  description = "this var has the value of the environment we are going to provision infrastructure in"
  type = string
}

variable "public_key_file" {
  description = "this is the path for the pub key file location"
}

//This Var has a list of AZs
variable "availability_zones" {
  description = "this var has the list values of AZs"
  type = list(string)
}

variable "instance_type" {
  description = "this is a list of instance types available"
  type = list(string)
}

variable "subnet_id" {
  description = "this var has the value od subnet.id from subnet module"
}

variable "image_name" {
  description = "this var has the value of ec2 image"
}
