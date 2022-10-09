# Create ECR on AWS
  One ECR for One Image and it's Versions
  ECR Name "my-app"

# Build Image 
  Tag "my-app:1.0"

# ECR Login and Push
  Follow Login Commands
  $docker tag my-app:1.0 158282080067.dkr.ecr.eu-central-1.amazonaws.com/my-app:1.0   => # Using the Version "1.0"

