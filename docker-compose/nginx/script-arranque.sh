#!/bin/bash
apt update
apt install git -y
git clone https://github.com/IvanciniGT/webEjemploAnsible /tmp/web
cp -rv /tmp/web/* /usr/share/nginx/html
nginx -g "daemon off;"
