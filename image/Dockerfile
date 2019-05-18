FROM centos:latest
MAINTAINER Arun K Singh
RUN yum -y install httpd
COPY index.html /var/www/html/
CMD ["hostname -i > /var/www/html/index.html"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80