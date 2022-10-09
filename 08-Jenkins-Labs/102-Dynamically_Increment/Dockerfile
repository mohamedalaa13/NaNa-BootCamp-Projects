FROM openjdk:8-jre-alpine

EXPOSE 8080

# Here We used * to take version any not a specific one 
COPY ./target/java-maven-app-*.jar /usr/app/      

WORKDIR /usr/app

CMD java -jar java-maven-app-*.jar
