## Use an official OpenJDK runtime as a parent image
#FROM openjdk:21-jdk
#
## Set the working directory inside the container
#WORKDIR /app
#
## Copy the project's JAR file into the container
#COPY target/CRUD-0.0.1-SNAPSHOT.jar /app/app.jar
#
## Expose the port your Spring Boot app runs on
#EXPOSE 8080
#
## Command to run the JAR file
#ENTRYPOINT ["java", "-jar", "/app/app.jar"]

FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/CRUD-0.0.1-SNAPSHOT.jar CRUD.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","CRUD.jar"]

