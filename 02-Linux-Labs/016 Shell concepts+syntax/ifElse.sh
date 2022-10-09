#!/bin/bash
folderName=test
folderContent=$(ls test)
if [ -d "test" ]
then
  echo "Folder test exists."
else
  echo "Creating Folder test ....."
  mkdir test
fi
echo "This is the Content of $folderName : $folderContent"