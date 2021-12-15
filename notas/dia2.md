# Docker

Empresa especializada en el mundo de los contenedores

## Productos

Docker engine ***
Docker compose.  ****
Docker Desktop
Docker hub    ***

## Docker engine

Gestor de contenedores

## Contenedor

Entorno aislado dentro de un SO Linux donde ejecutar procesos.

### Entorno aislado:
- Sistema de archivos (FileSystem) independiente del host
- Configuración propia de red
- Limitación de acceso recursos
- Tiene su propio enviroment

## Un contenedor se crea desde una Imagen de contenedor

Una imagen es un archivo zipeado con un programa ya instalado de antemano
Además, una imagen incluye:
- Configuración inicial, aunque parametrizable
- Información adicional acerca de la forma de uso de la imagen

comando:
    $ docker <tipo:objeto> <operacion> <args>               ALIAS

tipos-objeto: image container network volume secret
operaciones: list create rm run start stop restart inspect pull 


#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
# Sistema de archivos / FileSystem

Linux < Unix
/
    bin/        Donde hay comandos ejecutables
    opt/        Instalan programas
    etc/        Configuraciones de programas
    var/        Datos de programas  
    tmp/        Temporal
    home/       Carpeta de usuarios
    root/       Carpeta del usuario root
    usr/



# Unix

Qué fue UNIX® ? Un sistema operativo antiguo.
Qué es UNIX®  ? Un conjunto de estandares, acerca de cómo montar un SO: POSIX & SUS

SO Unix®: Que cumple con la especificación UNIX: POSIX + SUS
Oracle: Solaris (Sun microsystems - Sparc)
IBM:    AIX
HP:     HP-UX
Apple:  MacOS

Universidad de Berkley en California: 386BSD que supuestamente cumplia con la spec UNIX
    -> Familia de SO BSD: FreeBSD, NetBSD, MacOS
Richard Stallman: GNU
    GNU is Not Unix
    SO:
        shell CLI: Interpretes de comandos: bash
        shell tipo UI: GNOME 
        juegos: chess
        gedit
        kernel
Linus Torwals < Kernel Linux (Linus' UNIX)
    GNU/Linux < Redhat
                    Fedora
                    Oracle Linux
                Debian
                    Ubuntu
                OpenSuse
Android: Linux
No lleva librerias de GNU.. sino de Google

MSDOS
Windows NT < XP, Server 7,8, 10, 11

###########################################
Instalar docker:
/ <<< root raiz
    bin/
    opt/
    etc/
    var/
        lib/
            docker/
                    images/
                            nginx/            SOLO TIENE PERMISOS DE LECTURA, PERO NO DE ESCRITURA
                                    bin/
                                        ls
                                        mkdir
                                        cd
                                        rm
                                        bash
                                        sh
                                    opt/
                                        nginx/
                                            nginx
                                    etc/
                                        nginx/
                                            nginx.conf
                                    var/
                                    tmp/
                                    home/
                                    root/
                                    usr/
                    containers/
                            mi-nginx/
                                    tmp/
                                        archivo1.txt
                            mi-nginx2/
    tmp/
    home/
        misdatos/
    root/
    usr/
    
    
SISTEMAS DE ARCHIVOS (FILESYSTEM). Esta formado por la superposición de capas
    
            Persistencia de los datos con independencia de la vida de un contenedor concreto
LAYER 2 - VOLUMENES             < Persistencia real (Ubicación real) es una controlada por mi: HOST: /home/misdatos
                                        var/
                                            mysql/
LAYER 1 - Capa del contenedor
                                                tmp/
                                                    archivo1.txt
LAYER 0 - Imagen del contenedor: INALTERABLE
                bin/    opt/    etc/    var/    tmp/    home/    root/    usr/
                ls         nginx/                   archivo0.txt
                mkdir       nginx
                           mysql/
                            mysqld


Cuando trabajamos con contenedores la operación de borrar un contenedor es frecuente? MUY FRECUENTE

MySQL 5.1.  Tiro a la basura
    
MySQL 5.1.1 Nueva imagen + contenedor


# Interfaz de red             <<<< SOFTWARE
# Network Interface Card.     <<<< HARDWARE virtualización a nivel de hardware

Servidor
            -NIC1-|
   Interfaz<      |
            -NIC2-|
                 |red de mi empresa


Cuantás interfaces de red al menos tenemos
––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– Red de amazon
             | 172.31.14.254:8080                        | 172.31.17.98
            HOST  (172.31.14.254:8080 > 172.17.0.2:80 )  HOST 
  127.0.0.1  | | 172.17.0.1
             | |- nginx 172.17.0.2:80 
             | |- mysql 172.17.0.3:3306
             | | red de docker
             |
             | red de loopback


Características diferencian a un entorno de producción de cualquier otro entorno?
- Alta disponibilidad: Cumplir con unos tiempos de operatividad establecidos de antemano
                       Ser capaz de resolver incidencias que se puedan producir
- Escalabilidad:       Capacidad de ajustar los recursos a las necesidades de cada momento
- Seguridad

Clusters
    Maquina 1   
        docker
        C1a: nginx.  --------------- LoadBalancer <<<<<
        C2a: mysql                 |
    Maquina 2                      |   crio - containerd
        docker                     |
        C1b: nginx    -------------| 
        C2b: mysql
    Maquina 3
        docker
    Maquina 4
        kubernetes cp
        docker
        app2
        C2c: mysql

Almacenamiento externo:
    nfs
    iscsi
    Cloud
    cabina fibre channel
    
    
    
    
Sistemas
    Servicios < actualización de software 
    protocolo rest: http(s)
    
Cajero: PIN
        Saldo                               verificacion PIN
        Sacar dinero
                                            saldo
Web:    PIN
        Saldo                               sacar dinero
        Sacar dinero
        
        
        service mesh


Wordpress < C php + serv web (apache)
BBDD < C

YAML