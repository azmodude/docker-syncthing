#!/usr/bin/with-contenv /bin/bash
MYIP=$(hostname -i)
SYNCTHING_API_KEY=$(cat /.apikey)

exec s6-setuidgid "${RUN_USER}" syncthing-inotify \
    -target="http://${SYNCTHING_WEBUI_ADDRESS:-$MYIP}:${SYNCTHING_WEBUI_PORT}" \
    -api="${SYNCTHING_API_KEY}"
