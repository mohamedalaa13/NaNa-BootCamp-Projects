//Use my MohamedAlaa15 AWS Account Credentials 
provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA5D433EF27H3KU4ES"                           //You can find them in this file: ~/.aws/credentials
  secret_key = "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"
}


//Variable with subnet cidr value "10.0.1.0/24"
variable "dev_subnet1_cidr_block" {
  description = "this var has the value of dev-subnet1 cidr"
  default = "10.0.1.0/24"
}

//Variable with vpc cidr value "10.0.0.0/16"
variable "dev_vpc_cidr_block" {
  description = "this var has the value of dev-vpc cidr"
  default = "10.0.0.0/16"
}

//This Var has a list of CIDR Blocks
variable "default_subnets_cidr_block" {
  description = "this var has the list values of default_subnets_cidr_block"
  type = list(string)
}


//Create the VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = var.dev_vpc_cidr_block
  tags = {
    Name = "dev-vpc"
  }
}


//Create the subnets
resource "aws_subnet" "dev-subnet-1" {
  
  vpc_id     = aws_vpc.dev-vpc.id          //here we reference "dev-vpc-id" which is not created yet
  cidr_block = var.dev_subnet1_cidr_block  // here we call this var inside this resource
  availability_zone = "eu-central-1a"      // here we use some AZ inside our Region
  tags = {
    Name = "dev-subnet-1"
  } 
}


// here i fetch the data and make filter to get the "default vpc"
data "aws_vpc" "existing_default_vpc" {
  default = true
}


// Take the data out of previous data query on default vpc and use it to create subnet inside it using the default vpc's id
resource "aws_subnet" "default-subnet-exist-1" {

  vpc_id     = data.aws_vpc.existing_default_vpc.id         //here we reference the id of "default vpc" we got from data 
  cidr_block = var.default_subnets_cidr_block[0]            // CIDR Block of default vpc. //This CIDR needs to be different from other subnets of default vpc //here we are using first CIDR in the List
  availability_zone = "eu-central-1a"      
  tags = {
    Name = "default-subnet-exist-1"
  } 
}


//Output of VPC
output "dev-vpc-output" {
  value = aws_vpc.dev-vpc.id     //here we output the id of this VPC
}

//Output of Subnet
output "dev-subnet1-output" {
  value = aws_subnet.dev-subnet-1.id     //here we output the id of this Subnet
}



