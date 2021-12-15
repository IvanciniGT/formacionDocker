$ docker <tipo-objeto> <operacion> <args>

tipos de objeto:
    image*
    container*
    volume
    network
    secret
    
operaciones:
    list
    create
    rm
    start
    stop
    restart
    pull
    build
                                                                                ALIAS
# IMAGENES

## Listado de las imagenes de contenedor que tengo
$ docker image list                                                             $ docker images
                    -q 

## Borra una imagen
$ docker image rm ID                                                            $ docker rmi ID

## Descargar una imagen de contenedor desde un repositorio. Por defecto en https://hub.docker.com/
$ docker image pull NOMBRE-IMAGEN                                               $ docker pull NOMBRE-IMAGEN
    
    NOMBRE_IMAGEN:  repo:tag
        repo: Atiende al software que me quiero descargar
        tag:  Versión (Qué imagen concreta).  latest < Ultima version subida: Entornos de producción PROHIBIDO
        
        Si yo no especifico un tag... Docker busca el LATEST

# CONTENEDORES

## Crear un contenedor desde una imagen
$ docker container create <ARG> NOMBRE-IMAGEN
    ARG:
        --name NOMBRE-CONTENEDOR
        -v RUTA-HOST:RUTA-CONTENEDOR                     # Permite definir volumenes adicionales (CAPAS ADICIONALES) en el FileSystem
        -p IP-HOST?:PUERTO-HOST:PUERTO-CONTENEDOR
            IP-HOST: Por defecto: 0.0.0.0 = Toda las IP del host
        -e VARIABLE=VALOR # Variables que inyectar en el env del contenedor
## Ver los contenedores en ejecución que tengo en mi maquina
$ docker container list                                                         $ docker ps

## Ver TODOS los contenedores que tengo en mi maquina, independientemente de su estado
$ docker container list --all

## Borra un contenedor
$ docker container rm ID o NOMBRE                                               $ docker rm ID o NOMBRE

## Arrancar el contenedor
$ docker container start NOMBRE                                                 $ docker start NOMBRE

## Inspeccionar un contenedor/ VEr sus datos de configuracion 
$ docker container inspect NOMBRE                                              $ docker inspect NOMBRE

## Para el contenedor
$ docker container stop NOMBRE                                                  $ docker stop NOMBRE

## 
$ docker run --name NOMBRE IMAGEN
    docker image pull
    docker container create
    docker start
    docker attach < -d (dettached)
    
## Ejecutar procesos nuevos dentro de un contenedor
$ docker exec NOMBRE COMANDO