## Pull both "mongodb" and "mongodb_express" Images from DockerHub
    $docker pull mongo
    $docker pull mongo-express

## Create Docker Network for mongodb
    $docker network create mongodb_network

## Create mongodb container with env_varibales "username+password" and network and forward port 
    $ docker run -d -p 27017:27017 --network mongodb_network --name mongodb \
    -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
    -e MONGO_INITDB_ROOT_PASSWORD=secret \
    mongo

## Create mongo_express container with env_varibales "ME_CONFIG_MONGODB_ADMINUSERNAME"+"ME_CONFIG_MONGODB_ADMINPASSWORD" 
## to authunticate our mongodb "username+password" and env_varibales "ME_CONFIG_MONGODB_SERVER"to authunticate mongodb_container
       $docker run -d \
        -p 8081:8081 \
        --network mongodb_network \
        -e ME_CONFIG_MONGODB_ADMINUSERNAME=mongoadmin \
        -e ME_CONFIG_MONGODB_ADMINPASSWORD=secret \
        -e ME_CONFIG_MONGODB_SERVER=mongodb \
        --name mongo_express \
        mongo-express
       $docker logs "mongo-express container id"

