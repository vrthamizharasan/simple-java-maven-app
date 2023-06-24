FROM openjdk:22-slim-bullseye
WORKDIR /app
COPY ./*.jar  .
ENTRYPOINT [ "java" ; "-jar"; "my-app-1.0-SNAPSHOT.jar"]
EXPOSE 8080
