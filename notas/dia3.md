# Contenedores

Entorno aislado dentro de un sistema operativo LINUX en el que ejecutar procesos

Entorno aislado?
- Sistema de ficheros propio:
    Capas:
        Capa base: Se saca de la imagen: Es inmutable
        Sobre ella: Capa del contenedor: Aquí es donde se guardan las modificaciones 
                    que ocurren en el fs del contenedor... a priori
        Podemos montar capas adicionales: Volumenes
            Esos volumenes tienen persistencia fuera del contenedor y por ello
            sobreviven a su muerte, pudiendo reutilziarlos
- Configuración propia de red.
    Por defecto al instalar docker, se egenra una interfaz de red lógica 172.17.0.0/16
    Los contenedores se "pinchan" a esa red.
    Docker permite crear interfacces de red adicionales, con distintas características.
    Esto supone que quién puede a priori acceder a los puertos de un contenedor?
        El host y el resto de contenedores que estén pinchados a esa red.
    Si quiero que otras personas puedan acceder a esos puertos... que hacemos?
        Una redirección de puertos en las interfaces de red del host.
- Limitación de acceso a recursos.
- Su propio entorno de variables: ENVIRONMENT.
    Esto es especialmente útil para configurar los procesos que corren en un determinado contenedor