## Jenkins Built-in Environment Variables
  ## 1-Use this Jenkins URL
     this is the URL: http://localhost:2020/env-vars.html/     => # Adding "env-vars.html" to jenkins URL

###  ################################################################################################################

## Using Credentials Once int the Stage{}
   ## 1-Add the Type of Credential=> usernamePassword
   ## 2-Add credential-id=> 'credential-id'
   ## 3-Use username+password defined in Variables
  stage ("Deploy App"){
    steps{
        withCredentials{[
            usernamePassword(credentials: 'credential_id', usernameVariable: User_Name, passwordVariable: Passwd)     
        ]}
    }
  }
    
## ####################################################################################################################

## Using tools{} to add building tools (npm, maven, ......)
  ## 1-maven=> the name of the tool
  ## 2-'Maven'=> the name of the installation added in "Jenkins_Global-Tool-and-Configuration"
   tools {
       maven 'Maven'
   }
  ## You can now use it in the stages


## ####################################################################################################################

 ## Using Parameters{}
   ## 1-define the type of parameter string()
   ## 2-there are other types: "string, choice, boolean, ......."
   parameters{
       string(name: 'Version', defaultValue: '1.0.0', description: "this is the version param")  
       booleanParam(name: 'executeTest', defaultValue: true, description: 'this is to execute tests') 
       choice(name: 'Version', choices: ['1.0.0', '1.0.1', '1.1.0'], description: 'there are version choices')  
   }
   ## Usage in stage{}
   when {
       expression {
           params.executeTest == true
       }
   }
   ## Here this stage will be executed only when this params=true