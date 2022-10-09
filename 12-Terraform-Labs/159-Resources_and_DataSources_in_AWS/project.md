## data {}:
  1. Makes you query the existing resources on your AWS account


## VERY IMPORTANT
## Destroy some specific resources:
   $terraform destroy -target aws_subnet.default-subnet-exist-1            => -target resource_type.resource_name

   ## Not a Best Practice => remove code from file and $terraform apply


## Terraform State Commands:
    1- $terraform state
          1.1- list => list all resources
          1.2- show "resource_name" => shows configurations of this resource:
                EX: $terraform state show aws_vpc.dev-vpc
          