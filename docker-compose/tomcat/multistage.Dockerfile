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

HEALTHCHECK --interval=10s \
            --timeout=5s \
            --start-period=40s \
            --retries=5 \
            CMD curl http://localhost:8081 || exit 1
                # script
# Hasta los 40s, no se inician los chequeos. 
#       Mientras tanto estamos en estado: starting

# Cada 10s se irá realizando el chequeo
#   Si un chequeo tarda más de 5s en contestar o devuelve 1
#       Nueva falta: Tarjeta Amarilla !

# Si llegamos a acumular 5 tarjetas amarillas => tarjeta ROJA:
#       Estado: unhealthy