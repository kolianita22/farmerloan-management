# Use Java 17
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Give permission to mvnw
RUN chmod +x mvnw

# Build project
RUN ./mvnw clean install -DskipTests

# Run application
CMD ["java", "-jar", "target/Farmerloan-0.0.1-SNAPSHOT.jar"]