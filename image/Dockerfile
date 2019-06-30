# This is the Dockerfile for 
# Pull base image
FROM centos:latest
# Maintainer
MAINTAINER Arun K Singh
# Install HTTPD 
RUN yum -y install httpd
# Copy INDEX.HTML in apache installed location
COPY index.html /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80