FROM bitnami/tomcat:latest

ARG URL_GIT
ARG NOMBRE_PROYECTO

USER root
RUN apt update
RUN apt install git -y
RUN git clone $URL_GIT /tmp/proyecto

RUN apt install maven -y
RUN cd /tmp/proyecto/$NOMBRE_PROYECTO && mvn clean package

RUN mv /tmp/proyecto/$NOMBRE_PROYECTO/target/$NOMBRE_PROYECTO.war /app
