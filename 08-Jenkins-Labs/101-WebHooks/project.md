 ## How to Setup using WebHooks for GitLab

    1- Install "GitLab" Plugin in Jenkins DashBoard
    2- go to "Manage Jenkins" => "System Configuration" 
    3- in GitLab 
        3.1- Add ConnectionName EX: "gitlabconn"
        3.2- Add "https://gitlab.com/" GitLab URL
        3.3- Generate a new "GitLab_Api_Token" get it from GitLab
        3.4- Test Connection
        4.5- Save

    4- Add Configurations in GitLab Project EX: "java-maven-app"
       4.1- Settings => Integrations => Jenkins
       4.2-  Enable: Active          Trigger: Push
       4.3-  Add the URL of Jenkins
       4.4- Add the Jenkins Project Name 
       4.5- Add Username and Password for Jenkins
       4.6- Click Save then click test connection to validate


NOTE: GitLab Integeration doesn't work on "localhost" Jenkins URL

NOTE: For MultiBranch this won't work we need to use another plugin "Multibranch Scan Webhook Trigger" 
   ## check the Video for the Configuration