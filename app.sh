#!/bin/bash

# Install Tomcat
yum install -y tomcat8

# Download the Java web application's WAR file
curl -O http://example.com/app.war

# Copy the WAR file to the webapps directory
cp app.war /usr/share/tomcat8/webapps/

# Start Tomcat
systemctl start tomcat8
