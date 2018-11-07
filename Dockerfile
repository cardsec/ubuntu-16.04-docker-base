FROM ubuntu:16.04

LABEL "com.scalsec.infra.docker"="ScaleSec GCP Cloud Build Demo - Ubuntu 16.04 Docker base image"
LABEL "MAINTAINER"="Gordon Young <gordon@scalesec.com>"
# Iben was here

RUN apt-get update && apt-get -y install ca-certificates
RUN apt-get -y install locales
RUN apt-get -y install bash 
RUN apt-get install -y apache2
RUN mkdir /var/run/apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# since we are not doing an APT-GET UPGRADE many binary module will be old and have vulnerabilities that 
# will be found by any decent image scanner

# ADD https://get.aquasec.com/microscanner /
# RUN chmod +x /microscanner
# fork this repo and edit this next line with your own scanner API key
# RUN /microscanner 3MTsss_replace_me_ZdddiM



