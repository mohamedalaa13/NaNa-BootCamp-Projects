//Provider
provider "aws" {
    region = "eu-central-1"
}

//Data to dynamically get the AZs inside this Region
data "aws_availability_zones" "azs" {}

//Variables
variable "vpc_cidr_block"{}
variable "private_subnet_cidr_blocks"{}
variable "public_subnet_cidr_blocks"{}

//Modules
module "eks-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  
  name = "eks-vpc"
  cidr = var.vpc_cidr_block
  private_subnets = var.private_subnet_cidr_blocks                        //Private Subnets CIDR Blocks
  public_subnets = var.public_subnet_cidr_blocks                          //Public Subnets CIDR Blocks
  azs = data.aws_availability_zones.azs.names                             //get the names of the AZs dynamically from the "data"

  enable_nat_gateway = true                                               //it's enabled by default
  single_nat_gateway = true                                               //enables shared nat gateway for all private subnets
  enable_dns_hostnames = true                                             //enable dns for public and private ips

  tags = {
     "kuberenetes.io/cluster/my-eks-cluster" = "shared"                   //make "my-eks-cluster" uses this spicific vpc and subnets in it 
  }

  public_subnet_tags = {
      "kuberenetes.io/cluster/my-eks-cluster" = "shared"
      "kubernetes.io/role/elb" =1                                        //to be used when we create k8s svc type loadBalancer to external ips
  }

  private_subnet_tags = {
      "kuberenetes.io/cluster/my-eks-cluster" = "shared"
      "kuberenets.io/role/internal-elb" = 1                              //to be used when we need internal-elb within the private subnet
  }
}