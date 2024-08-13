# Use an official OpenJDK runtime as a parent image
FROM openjdk:21-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the project's JAR file into the container
COPY target/CRUD-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
