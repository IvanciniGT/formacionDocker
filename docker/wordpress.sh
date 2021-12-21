mkdir -p /home/ubuntu/environment/datos/wp/mysql
chmod 777 /home/ubuntu/environment/datos/wp/mysql
mkdir -p /home/ubuntu/environment/datos/wp/wp
chmod 777 /home/ubuntu/environment/datos/wp/wp

docker \
    container create \
    --name wp-mysql \
    -v /home/ubuntu/environment/datos/wp/mysql:/var/lib/mysql \
    -p 172.17.0.1:3306:3306 \
    -e MYSQL_ROOT_PASSWORD=password \
    -e MYSQL_DATABASE=wp \
    -e MYSQL_USER=usuario \
    -e MYSQL_PASSWORD=password \
    mysql:latest
    
docker \
    container create \
    --name wp \
    -v /home/ubuntu/environment/datos/wp/wp:/var/www/html \
    -p 0.0.0.0:8080:80 \
    -e WORDPRESS_DB_HOST=172.17.0.1 \
    -e WORDPRESS_DB_NAME=wp \
    -e WORDPRESS_DB_USER=usuario \
    -e WORDPRESS_DB_PASSWORD=password \
    wordpress:latest

docker start wp-mysql
docker start wp

#    HOST 172.17.0.1
#    |
#    |- wp-mysql   172.17.0.1:3306:3306
#    |  ^ (Si... pero como? IP-wp-mysql:3306)
#    |- wp      0.0.0.0:8080:80
#    |
#    | red de docker