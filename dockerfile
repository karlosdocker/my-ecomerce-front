# Usar la imagen base de Apache sobre Ubuntu
FROM ubuntu/apache2:latest

# Actualizar los repositorios y instalar PHP y los módulos de Apache para PHP
RUN apt-get update && apt-get install -y \
    php \
    libapache2-mod-php \
    php-mysql \   
    && apt-get clean
#reparar paquete con vulnerabilidades, no son criticas
#libexpat1=2.6.1-2ubuntu0.1 \
#curl=7.68.0-1ubuntu2.18 \
#libapr1=1.7.0-6ubuntu0.1 \

# Copiar el contenido de la carpeta local "html" al contenedor
COPY ./html/ /var/www/html/



# Exponer el puerto 80 para que el servidor sea accesible
EXPOSE 80

# Iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]


#docker run -d -p 80:80 --name my-ecomerce-front-container --network my-network my-ecomerce-front