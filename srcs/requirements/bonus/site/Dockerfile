FROM  debian:11

RUN apt-get update -y && apt-get install apache2 -y

RUN sed -i  's/80/81/g' /etc/apache2/ports.conf

COPY ./src /var/www/html    

CMD ["apachectl", "-D", "FOREGROUND"]