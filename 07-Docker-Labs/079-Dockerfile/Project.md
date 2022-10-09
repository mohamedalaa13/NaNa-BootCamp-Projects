## Create Dockerfile

## Build The Image
  $docker build -t 139646/my_app:1.0 .     => # Build Image with this tag so i can push the Image to my DockerHub Account

## Push The Image to DockerHub
  $docker login      => # Login to My Account
  $docker push 139646/my_app:1.0     => # Push the Image to my Account

## Create the Container
  $docker run -d 139646/my_app:1.0
  $docker exec -it "container_id"
  #env       => # To check the ENV_Variables in the Dockerfile