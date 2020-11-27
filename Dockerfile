FROM ghcr.io/azmodude/baseimage:ubuntu-latest
LABEL maintainer "Gordon Schulz <gordon@gordonschulz.de>"

RUN apt-get update && \
    apt-get -y --no-install-recommends install gnupg2 apt-transport-https && \
    curl -s https://syncthing.net/release-key.txt | apt-key add - && \
    echo "deb https://apt.syncthing.net/ syncthing stable" >  /etc/apt/sources.list.d/syncthing.list && \
    apt-get update && \
    apt-get -y install syncthing && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


HEALTHCHECK --interval=60s --timeout=30s --retries=3 \
    CMD /etc/services.d/syncthing/healthcheck
VOLUME /syncthing /syncthing-data
EXPOSE 8384 22000 21027/udp

COPY rootfs /
