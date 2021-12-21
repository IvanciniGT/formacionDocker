# docker build \
#    --build-arg NOMBRE_PROYECTO=mi-web-service \
#    --build-arg URL_GIT=https://github.com/IvanciniGT/automatizacionTesting \
#    -t mitomcat:latest \
#    -f ./multistage.Dockerfile . 

# docker run \
#   --rm \
#   -e ALLOW_EMPTY_PASSWORD=yes \
#   -p 8080:8080 \
#   mitomcat:latest

FROM bitnami/git AS clonador
ARG URL_GIT
RUN git clone $URL_GIT /tmp/proyecto


FROM maven:3.8.4-jdk-11 AS empaquetador
ARG NOMBRE_PROYECTO
COPY --from=clonador /tmp/proyecto /tmp/proyecto
RUN cd /tmp/proyecto/$NOMBRE_PROYECTO && mvn clean package


FROM bitnami/tomcat:latest
ARG NOMBRE_PROYECTO
USER root
COPY --from=empaquetador /tmp/proyecto/$NOMBRE_PROYECTO/target/$NOMBRE_PROYECTO.war /app

LABEL Mantainer="Ivan Osuna"
EXPOSE 8080
EXPOSE 8443
VOLUME ["/app"]

