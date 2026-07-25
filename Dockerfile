# ==========================================
# Stage 1: Build application JAR using Maven
# ==========================================
FROM maven:3.9.6-eclipse-temurin-17-alpine AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# ==========================================
# Stage 2: Minimal JRE 17 Runtime Environment
# ==========================================
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
EXPOSE 8080

# Copy compiled JAR from builder stage
COPY --from=builder /app/target/Farmerloan-*.jar app.jar

# Environment variable defaults
ENV PORT=8080

ENTRYPOINT ["java", "-jar", "app.jar"]