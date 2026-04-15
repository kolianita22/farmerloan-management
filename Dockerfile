FROM openjdk:17

WORKDIR /app

# Copy jar file
COPY target/*.jar app.jar

# Run app
ENTRYPOINT ["java","-jar","app.jar"]