#!/usr/bin/with-contenv /bin/bash
SYNCTHING_API_KEY=$(cat /.apikey)

exec s6-setuidgid "${RUN_USER}" syncthing-inotify \
    -target="http://${SYNCTHING_WEBUI_ADDRESS:127.0.0.1}:${SYNCTHING_WEBUI_PORT}" \
    -api="${SYNCTHING_API_KEY}"
