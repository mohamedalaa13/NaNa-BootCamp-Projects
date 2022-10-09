## If we want to output some attributes after the "terraform apply" command
   EX: 
       //Output of VPC
output "dev-vpc-id-output" {
  value = aws_vpc.dev-vpc.id     //here we output the id of this VPC
}
