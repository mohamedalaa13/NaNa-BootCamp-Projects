## Steps to use Groovy_Script files in your pipeline

## 1- Create groovy file => script.groovy
## 2-Use it in Jenkinsfile
    1- adding "Groovy Init" Stage where we will define the path of groovy_script File
    2- Define a variable to use "def gv"
    3- Using "gv" to call functions in "script.groovy" in the stage => gv."func_name"
    ## check the "jenkinsfile"
 ## NOTE: Groovy Script file can take any Variables defined in the Jenkins file
    EX: 
       echo "Param choice is true ${params.Version}"  => it can read ${params.Version}