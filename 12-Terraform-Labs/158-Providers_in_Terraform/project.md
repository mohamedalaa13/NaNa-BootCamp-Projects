## Make Terraform connect to my AWS Account
    1- $aws configure list
          Name                    Value             Type    Location
          ----                    -----             ----    --------
          profile                <not set>             None    None
          access_key     ****************U4ES shared-credentials-file
          secret_key     ****************lKc8 shared-credentials-file
          region             eu-central-1      config-file    ~/.aws/config

    2- We need to add these data in Terraform as well to connect to my AWS Account: In provider "aws" {}

    3- We need to install the aws after adding it to the provider:
        $terraform init