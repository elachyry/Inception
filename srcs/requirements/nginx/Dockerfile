FROM debian:11

RUN apt -y update && apt -y install nginx && apt -y install openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 \
    -out /etc/nginx/ssl/certificate.crt \
    -keyout /etc/nginx/ssl/private.key \
    -subj "/C=MA/ST=Marrakech/L=Benguerir/O=1337/OU=Student/CN=melachyr.42.fr"


COPY conf/melachyr.conf /etc/nginx/conf.d/melachyr.conf

CMD ["nginx", "-g", "daemon off;"]