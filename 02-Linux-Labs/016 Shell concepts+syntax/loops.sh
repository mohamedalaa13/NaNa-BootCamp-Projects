#!/bin/bash

#While Loop Example

while true
  do
    read -p "Enter Name:" name
    if [ "$name" == "q" ]
    then
      break
    fi
    echo "Again ...."
  done
########################################################################

#Get the Project Name as User Input and creates Folders with them

# for param in $*
#   do
#     echo "This is project : $param"
#     mkdir $param
#   done



