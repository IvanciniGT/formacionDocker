Tipos de software:
    Aplicaciones    X      Requieren interaccion con un usuario
    Demonios                No requieren comunicacion (indefinidamente)
    Servicios               Si requieren comunicación (indefinidamente-puerto)
    Scripts                 No requieren comunicacion

En un contenedor, como mucho, podremos comunicarnos con una app a través de un puerto.

maven 
    (Entorno maven + java - versiones)
    maven clean
    maven package
    

<!--
maven: programa que se utiliza para compilar, empaquetar y gestionar dependencias automaticamente para apps JAVA
J2EE
App servers:
    Tomcat
    JBoss
    WildFly
    Websphere - IBM
    Weblogic
-->

Que estaría guay?
Empresa... desarrollo: mi-web-service
    V
    Sistemas para que lo instale.
    
Metodo desfasado:
    Entregable de desarrollo? WAR
                                V
    Sistemas: Tomcat configurado segun dicte desarrollo

Metodo guay!
    Entregable desarrollo:
        git
        comando docker que genera el war
        
Metodo superguay del paraguay!
    Entregable mejor que yo podría hacer (desarrollo)
        Imagen de contenedor:
            - From: bitnami/tomcat:latest
            - Que incluya el war

Cuantos contenedores necesito crear? para. hacer ese trabajo?
La imagen final que debe contener?
    Tomcat
    App   < maven, git 
    Dockerfile -> Imagen tal y como la necesitamos