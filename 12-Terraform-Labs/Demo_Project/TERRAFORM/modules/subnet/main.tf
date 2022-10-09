//Create the subnets
resource "aws_subnet" "myapp-subnet-1" {
  
  vpc_id = var.vpc_id                                 //here we reference "myapp-vpc-id" which is not created yet
  cidr_block = var.myapp_subnet1_cidr_block           // here we call this var inside this resource
  availability_zone = var.availability_zones[1]     // here we use some AZ inside our Region
  tags = {
    Name = "${var.env_prefix}-subnet-1"
  } 
}


// Create Internet-Gateway to make the VPC access the Internet
resource "aws_internet_gateway" "myapp-igw" {
  vpc_id = var.vpc_id                     //here we reference "myapp-vpc-id"
  tags = {
      Name = "${var.env_prefix}-igw"
    }
}

// Create Route Table which has internal connection inside VPC configured already and internet connection by igw
resource "aws_route_table" "myapp-route-table" {
  vpc_id = var.vpc_id                                 //here we reference "myapp-vpc-id"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id     //here we reference the igw in the route table 
  }
  tags = {
      Name = "${var.env_prefix}-route-table"
    }
}


// Associate the Subnet to the Route Table
resource "aws_route_table_association" "a-rtb-subnet" {
  subnet_id      = aws_subnet.myapp-subnet-1.id                     //reference the subnet-id
  route_table_id = aws_route_table.myapp-route-table.id             //reference the Route-Table-id
}
