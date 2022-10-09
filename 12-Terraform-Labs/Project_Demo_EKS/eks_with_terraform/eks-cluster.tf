//Define the k8s Authentication
provider "kubernetes" {
#    load_config_file = "false"
   host = data.aws_eks_cluster.my-eks-cluster.endpoint                                                         //get the eks endpoint from the eks data object "aws_eks_cluster"
   token = data.aws_eks_cluster_auth.my-eks-cluster.token                                                     //get the eks token from the eks data object "aws_eks_cluster_auth"
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.my-eks-cluster.certificate_authority[0].data)   //get the cluster_ca_cert in decoded format
}


data "aws_eks_cluster" "my-eks-cluster" {
   name = module.eks-cluster.cluster_id                                        //get the data of this object "aws_eks_cluster" using cluster_id
}

data "aws_eks_cluster_auth" "my-eks-cluster" {
   name = module.eks-cluster.cluster_id                                       //get the data of this object "aws_eks_cluster" using cluster_id
} 


module "eks-cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.23.0"
  
  cluster_name = "my-eks-cluster"
  cluster_version = "1.21"

  vpc_id = module.eks-vpc.vpc_id                                               //reference the vpc from the module
  subnet_ids = module.eks-vpc.private_subnets                                 //reference the subnet_ids from module

  tags = {
      Environment = "dev"
  }
 
  //define the ec2 nodes
  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.small"]
    }
  }
    
}