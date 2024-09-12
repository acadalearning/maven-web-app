
# Stage 1: Build Jenkins image
#FROM jenkins:2.60.3 as jenkins_image

# No additional build steps needed, as Jenkins image is already built

# Stage 3: Clone Git repository and build Maven image
#FROM maven:3.9.6-eclipse-temurin-17 as maven_image

# Set working directory
#WORKDIR /app

# Clone Git repository
#RUN git clone https://github.com/Maryspear/maven-web-app.git .

# Build the Maven project
#RUN mvn clean package

# Stage 4: Build SonarQube image
FROM sonarqube:9.9.4-community as sonarqube_image

# No additional build steps needed, as SonarQube image is already built

# Stage 5: Build Nexus image
FROM sonatype/nexus3:3.67.1-java11 as nexus_image

# No additional build steps needed, as Nexus image is already built

# Stage 6: Build Tomcat image
FROM tomcat:9.0.88-jdk8-corretto as tomcat_image
RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps

# No additional build steps needed, as Tomcat image is already built


# Command to start Tomcat
CMD ["catalina.sh", "run"]
