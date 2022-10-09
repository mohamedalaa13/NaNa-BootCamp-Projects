//Print the public ip of EC2
output "myapp-ec2-public-ip" {
    value = module.myapp-server.server.public_ip
}
