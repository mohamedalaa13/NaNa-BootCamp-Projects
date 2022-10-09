## The Version increment only affects locally on jenkins it doesn't affect on the Git Repo
   Add "commit version update" stage to Jenkinsfile

## Ignore Commiter Startegy
  When we build and commit the webhook will trigger build again and commit and build again => infinite loop
  We need to configure "Ignore Commiter Startegy" so that we prevent this infinite loop
   ## This will ignore commits from jenkins and then prevents infinite loop
   This is the Build: http://localhost:2020/job/First_Pipeline/22/console