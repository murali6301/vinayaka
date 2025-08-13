# Use the official Tomcat image from Docker Hub
FROM tomcat:9.0

# Remove the default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file
COPY VinayakaApp.war /usr/local/tomcat/webapps/ROOT.war

# ✅ Copy PostgreSQL JDBC driver
COPY postgresql-42.7.5.jar /usr/local/tomcat/lib/

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
