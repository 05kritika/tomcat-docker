#From tomcat:8.0.51-jre8-alpine

#MAINTAINER kritika.bibhu@yash.com

#RUN rm -rf /usr/local/tomcat/webapps/*

#COPY ./target/*.war /usr/local/tomcat/webapps/

#EXPOSE 8080

#CMD ["/usr/local/tomcat/bin/catalina.sh","run"]



FROM centos
  
MAINTAINER kritika.bibhu@yash.com
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.46/bin/apache-tomcat-8.5.46.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.46/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
