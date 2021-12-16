#!/bin/bash
FROM nginx:latest

RUN apt update
RUN apt install git -y
RUN git clone https://github.com/IvanciniGT/webEjemploAnsible /tmp/web
RUN cp -rv /tmp/web/* /usr/share/nginx/html
#nginx -g "daemon off;"
