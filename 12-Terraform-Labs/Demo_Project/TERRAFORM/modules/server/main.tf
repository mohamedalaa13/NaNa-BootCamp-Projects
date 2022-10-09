// Security Group to allow traffic to our instances 
resource "aws_security_group" "myapp-SG" {
  name        = "myapp-SG"
  description = "Allow inbound and outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH Port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my_local_ip]                     //Only allow my Local ip to ssh
  }

  ingress {
    description      = "Nginx Port"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]                     //allow any ip to access
  }

  egress {
    description      = "Allow outcoming traffic to install things"
    from_port        = 0                                                     //allow any port and any protocol on any vpc
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    prefix_list_ids  = []
  }

  tags = {
    Name = "${var.env_prefix}-SG"
  }
}


//Using Data to dynamically get the latest ubuntu image instead of hardcode it in the code
data "aws_ami" "ubuntu-lts" {
   most_recent = true
   owners      = ["099720109477"]

   filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
   }
   filter {
     name = "virtualization-type"
     values = ["hvm"]
   }
}



//Make the key pair dynamic
resource "aws_key_pair" "server-key" {
  key_name   = "server-key"                          
  public_key = "${file(var.public_key_file)}"          //reference the public key from ~/.ssh/id_rsa.pub
}


//Create the EC2 Instance
resource "aws_instance" "myapp-ec2" {
   ami = data.aws_ami.ubuntu-lts.id                             //This wil fetch the latests ubuntu image in "eu-central-1" Region from data function before
   instance_type = var.instance_type[0]
   //reference the EC2 to be inside our vpc
   subnet_id = var.subnet_id                                      //reference the subnet inside the vpc from this var passed by module
   vpc_security_group_ids = [aws_security_group.myapp-SG.id]             //reference the Security Group inside the vpc
   availability_zone = var.availability_zones[1]                         //reference the AZ inside the vpc
   associate_public_ip_address = true                                    //so that it could be accessed by the internet
   
   key_name = aws_key_pair.server-key.key_name                           //associate the ec2 to the dynamically created key-pair

   user_data = file("entry-script.sh")                                   //calling the script file attached

   tags = {
      Name = "${var.env_prefix}-Instance"
    }
}
