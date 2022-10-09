## 1- Create a mongo-Deployment.yaml
   1- Has mongo image
   2- Has mongo port : 27017
   3- Has mongo env variables "MONGO_INITDB_ROOT_PASSWORD" and "MONGO_INITDB_ROOT_USERNAME"
   4- The values of these variables will be passed as a secret so it shouldn't be exposed on the Repo

## 2- Create the mongo-secret.yaml
   1- $echo -n "mohamedalaa" | base64
      bW9oYW1lZGFsYWE=
    
   2- $echo -n "passwd" | base64
      cGFzc3dk

## 3- Reference the Secrets "username+passwd" inside the deployment
   1- env:
        - name: MONGO_INITDB_ROOT_USERNAME
          valueFrom:
            secretKeyRef:
              name: mongo-secret
              key: MONGO_USER_NAME
        - name: MONGO_INITDB_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mongo-secret
              key: MONGO_PASSWORD

## 4- Create a svc so that you can expose the port "27017"
   1- create mongo-service.yaml


## #################################################################################################################################

## 5- Create mongoexpress-deployment.yaml
   1- Has mongo image
   2- Has mongo port : 8081
   3- Has mongo env variables "ME_CONFIG_MONGODB_ADMINPASSWORD" and "ME_CONFIG_MONGODB_ADMINUSERNAME"
   4- The values of these variables will be passed as a secret so it shouldn't be exposed on the Repo
   5- They are same as in mongo-deployment.yaml
   6- also add this variable "ME_CONFIG_MONGODB_SERVER" it will get value from the "configMap"

## 6- Create ConfigMap.yaml
   1- the url is the name of "mongo-svc" => mongo-service

## 7- Reference the ConfigMap "database_url" inside the deployment
   1- - name: ME_CONFIG_MONGODB_SERVER
          valueFrom:
            configMapKeyRef:
              name: mongoexpress-configmap
              key: database_url

## 8- Create svc type "LoadBalancer" to open external access
    1- mongoexpress-service.yaml is created

## 9- To access the browser 
    http://<public_ip_of_loadBalancer>:30000