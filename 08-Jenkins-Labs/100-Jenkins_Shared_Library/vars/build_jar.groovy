#!/usr/bin/env groovy

def call() {
    echo "Building Jar Application ...."
    sh 'mvn clean package'   //to remove older versions jar files 
}
