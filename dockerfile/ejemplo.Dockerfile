FROM ubuntu:latest AS imagen_ubuntu

RUN mkdir -p /tmp/datos
RUN echo HOLA > /tmp/datos/saludo.txt



FROM fedora:latest AS imagen_fedora
RUN mkdir -p /tmp/datos
RUN echo ADIOS > /tmp/datos/despedida.txt




FROM alpine:latest
RUN mkdir -p /final
COPY --from=imagen_ubuntu /tmp/datos/saludo.txt /final
COPY --from=imagen_fedora /tmp/datos/despedida.txt /final
