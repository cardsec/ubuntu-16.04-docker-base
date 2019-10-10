# FROM ubuntu:16.04
#FROM ubuntu
FROM cmendibl3/kubeinvaders:latest
LABEL "MAINTAINER"="Iben Rodriguez <iben.rodriguez@gmail.com>"
# Iben was here added tcpdump - 12212018

RUN apt-get update && apt-get -y install ca-certificates
RUN apt-get -y install locales
RUN apt-get -y install bash 
RUN apt-get install -y apache2 nmap tcpdump curl
RUN mkdir /var/run/apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
# . RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD tcpdump -i eth0 
CMD curl http://www.google.com:80
# EXPOSE 80
# CMD apachectl -DFOREGROUND

# CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
# RUN /usr/bin/namp localhost > /var/www/html/nmap.txt
# CMD ["/usr/bin/nmap"," localhost ","> ","/var/www/html/nmap.txt"]

# since we are not doing an APT-GET UPGRADE many binary module will be old and have vulnerabilities that 
# will be found by any decent image scanner

# ADD https://get.aquasec.com/microscanner /
# RUN chmod +x /microscanner
# fork this repo and edit this next line with your own scanner API key
# RUN /microscanner 3MTsss_replace_me_ZdddiM
# Dockerfile update with PID and Lock variables
