FROM azmo/base:debian-slim
LABEL maintainer "Gordon Schulz <gordon.schulz@gmail.com"

RUN apt-get update && \
    apt-get -y install gpg apt-transport-https && \
    curl -s https://syncthing.net/release-key.txt | apt-key add - && \
    echo "deb https://apt.syncthing.net/ syncthing stable" >  /etc/apt/sources.list.d/syncthing.list && \
    apt-get update && \
    apt-get -y install syncthing && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY rootfs /

VOLUME /syncthing /syncthing-data

EXPOSE 8384
