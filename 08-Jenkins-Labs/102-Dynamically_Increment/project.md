## Need to increment Application Version in the Pipeline

   stage('Increment App Version') {
            steps {
                script {
                    echo "Incrementing Application Version....."
                    sh 'mvn build-helper:parse-version versions:set \
                        -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                        versions:commit'
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'       //here we get the version of app from pom.xml 
                    def version = matcher[0][1]
                    env.IMAGE_NAME= "$version-$BUILD_NUMBER"
                }
            }
        }

## An approach on incrementing the version of docker image is to use same app version

    See the Jenkinsfile and Dockerfile

## NOTE
    with every increment the mvn will build new jar file and not deleting the old one
       sh 'mvn clean package'

## Important
   This is the jenkins build:  http://127.0.0.1:2020/job/First_Pipeline/16/console