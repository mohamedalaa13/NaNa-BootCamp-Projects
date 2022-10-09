#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sudo docker run -d --name nginx -p 8080:80 nginx
