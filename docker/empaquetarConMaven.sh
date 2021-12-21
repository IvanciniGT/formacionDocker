#!/bin/bash

# Ejecutar maven clean y package dentro de un contenedor que ya tenga java y maven configurado

# Que necesito:
#  Un contenedor con maven y java instalado dentro. Ya tengo una. Perfect
#  Necesito mi proyecto dentro del contenedor.  <<< ^ Esa imagen me sirve o necesito una imagen propia.
#                                                     Me sirve utilizando un volumen para inyectar mi proyecto dentro del contenedor
#  Dentro del contenedor ejecutar mvn clean
#  Dentro del contenedor ejecutar mvn package

# Necesito una imagen propia? 
#  No. 
# Necesitamos un Dockerfile? NO

# PASO 1: Crear el contenedor. Desde una imagen: "maven:3.8.4-jdk-11"
#         Me tengo que asegurar de ... montar un volumen con mi carpeta
docker container create \
    --name mi-maven \
    -v /home/ubuntu/environment/app/mi-web-service:/miapp \
    --workdir /miapp \
    maven:3.8.4-jdk-11 \
    mvn clean package 
# Nota: Este comando así puesto se ejecuta en el workingdir de la imagen... como está imagen no tiene working dir, se usa /

# PASO 2: Arrancar el contenedor.
docker start --attach mi-maven

#docker attach mi-maven

# PASO 3: Ejecutar "mvn clean package"
#Esto ya ocurre al hacer el start

# PASO 4: Paro el contenedor y lo borro
#docker stop mi-maven
#docker rm mi-maven

docker rm -f mi-maven # El -f hace el stop (si es necesario) antes de borrarlo.

# maven compile
# ansible-playbook playbook.yaml
# terraform fichero.tf

# Entorno de producción: cluster Kubernetes


docker run \
    -v /home/ubuntu/environment/app/mi-web-service:/miapp \
    --workdir /miapp \
    --rm \
    maven:3.8.4-jdk-11 \
    mvn clean package 
