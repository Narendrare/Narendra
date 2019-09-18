FROM tomcat
COPY target/*.war /usr/local/tomcat/webapps
CMD /usr/local/tomcat/bin/startup.sh
EXPOSE 8080


