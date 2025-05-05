FROM debian:11

RUN apt update -y && apt install -y redis-server

CMD ["redis-server", "--bind", "0.0.0.0"]