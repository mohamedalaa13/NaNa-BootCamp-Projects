//Variable with subnet cidr value "10.0.1.0/24"
variable "myapp_subnet1_cidr_block" {
  description = "this var has the value of myapp-subnet1 cidr"
  default = "10.0.1.0/24"
}

//Variable with vpc cidr value "10.0.0.0/16"
variable "myapp_vpc_cidr_block" {
  description = "this var has the value of myapp-vpc cidr"
  default = "10.0.0.0/16"
}


//This Var has a list of AZs
variable "availability_zones" {
  description = "this var has the list values of AZs"
  default = ["eu-central-1a"]
  type = list(string)
}

//Set the prefix of Environment
variable "env_prefix" {
  description = "this var has the value of the environment we are going to provision infrastructure in"
  default = "dev"
  type = string
}

variable "my_local_ip" {
  description = "This var has the value of my macbook's ip"
  default = "156.201.93.144/32"
}


variable "instance_type" {
  description = "this is a list of instance types available"
  default = ["t2.micro"]
  type = list(string)
}


variable "private_key_file" {
  description = "this is the path for the private key file location"
}

variable "image_name" {
  description = "this var has the value of ec2 image"
  default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}