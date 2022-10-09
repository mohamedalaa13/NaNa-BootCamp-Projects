#!/bin/bash

#Return Function
function sum() {
    total=$(($1+$2))  #Double(())
    return $total
}
sum 3 6
result=$?   #? is the value of the return
echo "Sum is $result"

############################################################

# function create_file() {
#     file_name=$1
#     touch $file_name
#     echo "Creating File : $file_name"
#     read -p "Is this File a Script ?" is_shell
#     if [ $is_shell = true ]
#     then
#       chmod u+x $file_name
#       echo "Changing File's Permissions ..."
#     fi

# }
# create_file test.sh
