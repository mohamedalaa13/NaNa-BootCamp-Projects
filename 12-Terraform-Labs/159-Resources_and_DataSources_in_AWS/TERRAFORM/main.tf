//Use my MohamedAlaa15 AWS Account Credentials 
provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIA5D433EF27H3KU4ES"                           //You can find them in this file: ~/.aws/credentials
  secret_key = "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"
}


//Create the VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev-vpc"
  }
}

//Create the subnets
resource "aws_subnet" "dev-subnet-1" {
  
  vpc_id     = aws_vpc.dev-vpc.id          //here we reference "dev-vpc-id" which is not created yet
  cidr_block = "10.0.1.0/24"
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
  cidr_block = "172.31.48.0/20"                            // CIDR Block of default vpc. //This CIDR needs to be different from other subnets of default vpc
  availability_zone = "eu-central-1a"      
  tags = {
    Name = "default-subnet-exist-1"
  } 
}