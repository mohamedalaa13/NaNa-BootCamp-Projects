FROM node:13-alpine

#Define ENV_Variables in the Container
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

#Create Directory /home/app in the Container
RUN mkdir -p /home/app

#Copy ./app in local to /home/app in Container
COPY ./app /home/app 

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]
