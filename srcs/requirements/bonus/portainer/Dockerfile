FROM debian:1

RUN apt-get update && apt-get install -y  curl 

RUN curl -L https://github.com/portainer/portainer/releases/download/2.27.5/portainer-2.27.5-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar xvzf portainer.tar.gz \
    && rm portainer.tar.gz \
    && chmod +x /portainer/portainer


CMD ["/portainer/portainer"]