FROM debian:11


RUN apt update -y && apt install -y mariadb-server

COPY tools/script.sh /script.sh
COPY ./conf/50-server.cnf /etc/mysql/my.cnf

RUN chmod +x script.sh


ENTRYPOINT ["./script.sh"]