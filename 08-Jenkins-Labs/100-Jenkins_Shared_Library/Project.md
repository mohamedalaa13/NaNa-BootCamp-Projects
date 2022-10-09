## How to make Jenkins-Shared-Library globaly used in jenkins DashBoard
  ## In Jenkins DashBoard
     1- Manage Jenkins
     2- Configure System
     3- Global Pipeline Libraries     +"add"
     4- Add the Version   => the version changes depending on (Branch or Tag or Commit) "it's prefered to use tag"
     5- Add the "Jenkins-Shared-Library" Repo Link

## #########################################################################################################################

## If we want to use "Jenkins-shared-library" not globaly 
  ## In "java-mave-app"'s Jenkinsfile

  library identifier: 'jenkins-shared-library@main', retriever: modernSCM([
    $class: 'GitSCMSource',
    remote: 'https://gitlab.com/naap_team/jenkins-shared-library.git'
    credentialsId: 'GitLab_Access_Token'
  ])