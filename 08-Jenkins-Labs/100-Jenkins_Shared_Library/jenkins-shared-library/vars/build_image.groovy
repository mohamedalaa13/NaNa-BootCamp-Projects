#!/usr/bin/env groovy

def call() {
    withCredentials  ([ usernamePassword(credentialsId: 'DockerHub_Credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
        sh 'docker build -t 139646/java-maven-app:3.0 .'
        sh "echo $PASSWORD | docker login -u $USER --password-stdin"
        sh 'docker push 139646/java-maven-app:3.0'
        echo "Image pushed Successfully ..... "
    }
}
