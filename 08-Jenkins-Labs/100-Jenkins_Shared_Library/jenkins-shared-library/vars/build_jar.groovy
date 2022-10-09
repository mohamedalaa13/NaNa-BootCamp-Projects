#!/usr/bin/env groovy

def call() {
    echo "Building Jar Application ...."
    sh 'mvn package'
}
