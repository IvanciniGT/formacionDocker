# Docker

Empresa
- Docker engine <<<<< DOCKER
- Docker Compose
- Docker desktop for Windows - for Mac
- Docker hub

# Docker engine <<<<<< IMPORTANTE

Es una herramienta (de tantas) para trabajar con contenedores e imágenes de Contenedor.

## Nota: Otras herramientas de contenedores:
Podman, Crio, Containerd

Kubernetes | Openshift

# Contenedor

Entorno aislado dentro de un SO Linux donde ejecutar procesos.
Aislado en cuanto a qué?
- Su propia configuración de RED
- Su propio FileSystem
- Limitación de acceso a recursos HARDWARE

## Esto es nuevo? 1 decada. Evalución del mundo de los contenedores: 40 años

MODELO TRADICIONAL
            
            App 1.      App 2
            ------------------
            Sistema Operativo
            ------------------
                HIERRO
    

MODELO MAQUINAS VIRTUALES
            
            App 1.  |   App 2
            ------------------
            SO 1.   |   SO 2
            ------------------
            MV 1.   |   MV 2
            ------------------
            Hipervisor (VMWARE, HyperV, Virtual BOX, Citrix, kvm)
            ------------------
            Sistema Operativo
            ------------------
                HIERRO
    
Dejan de ser problemas:
- Uso compartido del hierro
- Seguridad: La app1 puede espiar los datos de la app2
- Conflictos (librerias, dependencias)

Aparecen nuevos problemas:
- Gestión de recursos. 
- Performance

MODELO BASADO EN CONTENEDORES
                
            App 1.  |   App 2
            ------------------
            C 1.    |   C 2
            ------------------
            Gestor de contenedores (docker, podman, crio, containerd)
            ------------------
            Sistema Operativo LINUX - KERNEL
            ------------------
                HIERRO

## Los contenedores se generan desde IMAGENES DE CONTENEDOR
HOY EN DIA >>>>>TODO<<<<<< EL SOFTWARE empresarial (servicios, demonios, scripts....) se distribuye mediante IMAGENES DE CONTENEDOR

# Imagen de Contenedor
Existe un estandar que regula cómo montar imágenes de contenedor <<<<<<

--------------------------------------------------------------------------
Metodologias Ágiles. < AUTOMATIZAR (Empaquetado, pruebas, instalaciones)
    Metodologías Waterfall (en cascada)
    SCRUM
Dev--->ops > Cultura, filosofía: VAMOS A AUTOMATIZAR TODO LO AUTOMATIZABLE
    Empaquetado -> Pruebas -> Instalaciones -> Configuración entornos -> Operación -> Monitorización -> Infraestructura
    Admin Sistemas: Hacer programas que administren sistemas
    Tester:  Hacer programas que prueben programas
    
    Perfil Devops: Ansible, Puppet, Chef, Jenkins, Maven
    Kubernetes + Openshift
    
    Integración Continua.   Continuous Integration
        VVVVV.  SonarQube
    Entrega Continua.       Continuous Delivery
    Despliegue Continuo.    Continuous Deployment
    
Contenedorización
    Estandarización en la forma de Distribuir, Instalar y Operar Software
Cloud: Conjunto de servicios IT que ofrece una empresa a través de internet (AUTOMATIZADO)
    Microsoft: Azure
    Amazon:    AWS
    Google:    GCP
    
    
    
Desarrollo.  (Q&A    Preproducción.   Integración.  ).     Producción


App1
    Dia 1:     100 usuarios
    Dia 30:    200 usuarios
    Dia 100:  1000 usuarios
    Dia 300: 10000 usuarios

App2 - INTERNET
    Dia n:       100 usuarios <<<<<<<<< 1 ordenadorcito
    Dia n+1:  100000 usuarios
    Dia n+2:    1000 usuarios
    Dia n+3: 1000000 usuarios <<<<<<<< 10 ordenadoracos Puede cambiar de un minuto para otro

Escalabilidad: Capacidad de que mi entorno se ajuste a las necesidades de cada momento


Tipos de software:
    Aplicación  Software que se ejecuta en primer plano de forma indefinida en el tiempo
                y que requiere interacción con un usuario
    -----------------------------------------------------                
    Servicio    Software que se ejecuta en segundo plano de forma indefinida en el tiempo
                y que no requiere interacción con un usuario. Atiende peticiones de OTROS PROGRAMAS:
                    Servidor de aplciaciones, Servidor WEB, Servidor de BBDD
    Demonio     Software que se ejecuta en segundo plano de forma indefinida en el tiempo
                y que no requiere interacción con un usuario ni con otros programas.
    Script      Software que se lanza, (da igual en primer plano o no) y que hace unas tareas finitas en el tiempo
    -----------------------------------------------------                
    Driver
    SO
            Aplciación.    Servicio
Usuario > Navegador Web > Servidor WEB

# Imagen de Contenedor

Es un fichero ZIP con una versión de un software YA INSTALADO de antemano por alguien.
Además incluye unas configuraciones por defecto, parametrizables
Y otra información... para el que le pueda interesar. Sin uso práctico por parte del computador.


docker run --name mi-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:latest
