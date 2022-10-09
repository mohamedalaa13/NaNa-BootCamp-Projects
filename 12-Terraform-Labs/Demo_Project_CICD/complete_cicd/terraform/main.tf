terraform {
  required_version = ">= 0.12"
  //Configure S3 Bucket
  backend "s3" {
    bucket = "cicd-myapp-s3-bucket"
    key = "myapp/state.tfstate"
    region = "eu-central-1"
  }
  
}


//You can find them in this file: ~/.aws/credentials
provider "aws" {
  region = "eu-central-1"
}

//Create the VPC
resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.myapp_vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}


//Define the Subnet Module
module "myapp-subnet" {
   source = "./modules/subnet"                                      //path to module folder
   myapp_subnet1_cidr_block = var.myapp_subnet1_cidr_block
   availability_zones = var.availability_zones
   env_prefix = var.env_prefix
   vpc_id = aws_vpc.myapp-vpc.id
}

//Define the Server Module
module "myapp-server" {
  source = "./modules/server"
  vpc_id = aws_vpc.myapp-vpc.id
  my_local_ip = var.my_local_ip
  env_prefix = var.env_prefix
  availability_zones = var.availability_zones
  instance_type = var.instance_type
  subnet_id = module.myapp-subnet.myapp-subnet-1.id            //module.<module_name>.<output_name_in_module_outputfile>.<id>
  image_name = var.image_name
}
