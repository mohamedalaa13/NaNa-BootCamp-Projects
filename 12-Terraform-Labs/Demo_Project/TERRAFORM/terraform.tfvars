//VPC CIDR
myapp_vpc_cidr_block = "10.0.0.0/16"

//Subnet CIDR
myapp_subnet1_cidr_block = "10.0.1.0/24"

//AZs List
availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

//Env Prefix
env_prefix = "dev"

//My Local IP as a var
my_local_ip = "156.201.78.168/32"

//EC2 Instance Type List
instance_type = ["t2.micro"]

//public key location
public_key_file = "/Users/awaden/.ssh/id_rsa.pub"

//private key location
private_key_file = "/Users/awaden/.ssh/id_rsa"

//EC2 Image Name
image_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"