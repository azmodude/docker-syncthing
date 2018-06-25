#!/usr/bin/with-contenv /bin/bash
SYNCTHING_API_KEY=$(cat /.apikey)

exec s6-setuidgid syncthing syncthing -home="${SYNCTHING_HOME_DIRECTORY}" \
    -gui-address="${SYNCTHING_WEBUI_ADDRESS:-127.0.0.1}:${SYNCTHING_WEBUI_PORT}" \
    -gui-apikey="${SYNCTHING_API_KEY}" -no-browser
