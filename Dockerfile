# Stage 1: Build the application using Maven
FROM maven:3.8.5-openjdk-11 AS build
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the WAR file (skipping tests for faster deployment)
RUN mvn clean package -DskipTests

# Stage 2: Run the application using Tomcat
FROM tomcat:9.0

# Remove the default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# ✅ Copy the built WAR file from the build stage
# Maven builds the WAR in the 'target' directory with the finalName 'VinayakaApp'
COPY --from=build /app/target/VinayakaApp.war /usr/local/tomcat/webapps/ROOT.war

# ✅ Copy PostgreSQL JDBC driver (optional if already in pom.xml, but kept for compatibility)
COPY postgresql-42.7.5.jar /usr/local/tomcat/lib/

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

