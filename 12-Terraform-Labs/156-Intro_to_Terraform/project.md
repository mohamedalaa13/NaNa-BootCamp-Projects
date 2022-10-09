## Terraform Architecture
   ## 1- Terraform Core which uses two input sources:
        1.1- Terraform Configuration: Where i write what needs to be provisioned.
        1.2- Terraform State: keeps up to date state of current setup and what the infr looks like.
     Core takes these two inputs and makes a plan of what needs to be done (update,create,destroy) after comparing the current state and the desired state.
   ## 2- Providers:
      1.1- AWS, GCP, Azure, K8S .............

## Terraform Providers Docs
      This is the Link: https://registry.terraform.io/browse/providers
      This is link of AWS Examples like "VPC,EC2,EKS,........": https://registry.terraform.io/providers/hashicorp/aws/latest

## Some Basic Commands:

   1- $terraform refresh     => to get the current state
   2- $terraform plan        => to create execution plan
   3- $terraform apply       => to make the actual execution
   4- $terraform destroy     => to destroy resources
   