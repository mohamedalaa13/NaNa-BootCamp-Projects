#!/bin/bash


#reads the Inputs from User One by One
read -p "Enter Project Name: " project_name
read -p "Enter Env Name: " env_name
mkdir $project_name
touch $project_name/$env_name
echo "Project_Name is : $project_name"
echo "Env_Name is : $env_name"


############################################################


#Enters the Inputs with The run Command
# project_name=$1
# env_name=$2
# mkdir $project_name
# touch $project_name/$env_name
# echo "Project_Name is : $project_name"
# echo "Env_Name is : $env_name"