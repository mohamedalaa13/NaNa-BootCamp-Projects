## Using Input Params in Jenkinsfile

## Check here:
  
          stage("Deploy Env") {

            input {
                message "Choose the Env to deploy in"
                ok "Done"
                parameters {
                    choice(name: 'ENV', choices: ['DEV', 'TEST', 'PROD'], description: 'there are ENV choices')
                }

            }
            steps {
                script {
                   echo "This is the ENV: ${ENV}"
                }
            }
        }

## NOTE: there can be more than one input
EX:
  choice(name: 'ENV1', choices: ['DEV', 'TEST', 'PROD'], description: 'there are ENV choices')
  choice(name: 'ENV2', choices: ['DEV', 'TEST', 'PROD'], description: 'there are ENV choices')
  choice(name: 'ENV3', choices: ['DEV', 'TEST', 'PROD'], description: 'there are ENV choices')