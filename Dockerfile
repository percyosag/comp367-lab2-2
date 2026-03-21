# Stage 1: Build the Maven project
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
# Copy the pom.xml and source code to the container
COPY . .
# Package the application (this creates the .war file in the target folder)
RUN mvn clean package

# Stage 2: Setup the Web Server (Tomcat)
FROM tomcat:9.0-jdk17-openjdk
# Copy the .war file from the build stage to Tomcat's webapps folder
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
# Expose the port Tomcat runs on
EXPOSE 8080
