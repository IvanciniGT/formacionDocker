HEALTHCHECK

contenedor:
    Entorno aislado donde ejecutar procesos en un SO Linux

Cuando docker determina que un contenedor está saludable:
    - En disposición de hacer el trabajo para el que ha sido arrancado

Cuando arrancamos un contenedor (docker start), 
    hay un proceso (el definido en CMD del Dockerfile) que se 
    monitoriza por parte de docker.

Si docker detecta que ese proceso deja de funcionar (se muere) 
automaticamente detiene el contenedor.

HAY VECES QUE ESO NO SUFICIENTE

Web server -> Proceso SO -> pid 8736 < Docker
Para mi lo importante no es SOLO que el proceso siga vivo...
    Si no que siga atendiendo peticiones
    Y lo haga devolviendo lo que debe

Un HEALTHCHECK es un comando/proceso que se ejecuta en el contenedor
    Con una periodicidad concreta
    Docker mira lo que devuelve ese comando:
        0 - Todo OK
        1 - RUINA !!! El contenedor no está funcionando adecuadamente





Sistema en producción: Kubernetes:
    3 tipos de healthchecks:
        Startup Proves
            Es una prueba que hacemos para ver si un contenedor ha iniciado
        Lifeness Proves
            Es una prueba para ver si el contenedor sigue vivo
        Readyness Proves
            Es una prueba para ver si el contenedor está e un estado listo para atender peticiones


Mirar el id del proceso... y ver que sigue activo
    Starting... La pagina de Instalación contesta!
    Lifeness... La pagina de administración contesta.... La principal no contesta: MODO MAINTENANCE
    Readyness... La pagina principal de mi sitio ya conteste

BBDD
    Starting... Mirar el puerto 3306
    Lifeness... Puedo hacer login con mysql y el usuario root
        Lanzo un trabajo de backup en frio
    Readyness... Puedo hacer login con mysql y el usuario app

Wordpress
    Bienvenido a la instalación de Wordpress... Elija su idioma... Usuario / contraseña... nombre del sitio web
    

Pool de servidores BBDD en cluster
    Server 1        |
    Server 2         >      Balanceador de carga            <   Apps
    Server 3(mnto)  
    

Herramientas equivalentes a docker:
    containerD:.... realmente es docker
    
    podman:     POD Manager
    crio:       POD
    
    kubernetes
    openshift:  POD
    
    POD: Conjunto de contenedores que comparten:
         configuración de red y almacenamiento (VOLUMENES)
         
Elastic:
    ElasticSearch: Motor de busquedas / Indexador: Google
    Kibana
    Logstash
    Beats
        Stack ELK < Sistema monitorización de ultima generación

NagiOS
Prometheus  /Grafana
ElasticSearch/Kibana

Entorno de producción 10 web servers/app servers
Van generando logs: access_log apache

WebServer
    V
    access.log
    ^
Filebeat > Kafka < Logstash > Logstash > ElasticSearch < Kibana

Pod x 20 replicas escalabilidad
    Contenedor: nginx
    Contenedor: filebeat < Sidecar
    
LinuxContainer
LMCTFU

Docker Inc.
    docker engine < generar un estandar
                    opensource
                    freeware
    Redhat
    Windows
    AWS
    
docker (cli) -> dockerd
                    contruir una imagen de contenedor
                    login docker hub u otro registry
                    push
                 + containerd > (Antes era parte del cogido de dockerd) > Donado a una fundacion
                        pull
                        guardar imagenes
                        crear un contenedor
                        borrar un contenedor
                            + runc
                                Ejecutar un contenedor
