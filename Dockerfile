FROM maven:3.8.4-openjdk-17 AS builder

WORKDIR /app

COPY . .

RUN mvn package

# Tomcat image for deployment

FROM tomcat:9.0.56-jdk17-openjdk-slim

WORKDIR /usr/local/tomcat/webapps

# Copy the built WAR file from the Maven builder stage to the Tomcat webapps directory
COPY --from=builder /app/webapp/target/*.war .

EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]
