#!/usr/bin/env groovy

def call(String image_name) {
    withCredentials  ([ usernamePassword(credentialsId: 'DockerHub_Credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
        sh "docker build -t $image_name ."
        sh "echo $PASSWORD | docker login -u $USER --password-stdin"
        sh "docker push $image_name"
        echo "Image $image_name  pushed Successfully ..... "
    }
}

//Use image_name as Variable or Param