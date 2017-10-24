FROM azmo/base:debian
LABEL maintainer "Gordon Schulz <gordon.schulz@gmail.com"

RUN apt-get update && \
    apt-get -y install gpg apt-transport-https && \
    curl -s https://syncthing.net/release-key.txt | apt-key add - && \
    echo "deb https://apt.syncthing.net/ syncthing stable" >  /etc/apt/sources.list.d/syncthing.list && \
    apt-get update && \
    apt-get -y install syncthing syncthing-inotify && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY setup/00-create-users-fix-permissions.sh /etc/cont-init.d/
COPY setup/01-generate-api-key.sh /etc/cont-init.d/
COPY bin/syncthing-inotify.sh /etc/services.d/syncthing-inotify/run
COPY bin/syncthing.sh /etc/services.d/syncthing/run
COPY healthcheck/healthcheck.sh /etc/services.d/syncthing/healthcheck

ARG SYNCTHING_HOME_DIRECTORY
VOLUME ${SYNCTHING_HOME_DIRECTORY:-/srv/syncthing}
ARG SYNCTHING_DATA_DIRECTORY
VOLUME ${SYNCTHING_DATA_DIRECTORY:-/sync}

ARG SYNCTHING_WEBUI_PORT
EXPOSE ${SYNCTHING_WEBUI_PORT:-8384}
