FROM ubuntu:16.04

LABEL "com.scalsec.infra.docker"="ScaleSec GCP Cloud Build Demo - Ubuntu 16.04 Docker base image"
LABEL "MAINTAINER"="Gordon Young <gordon@scalesec.com>"

RUN apt-get update && apt-get -y install ca-certificates
RUN apt-get -y install locales
RUN apt-get -y install bash 

ADD https://get.aquasec.com/microscanner /
RUN chmod +x /microscanner
RUN /microscanner NjA3MTQyNGZiMTE3



