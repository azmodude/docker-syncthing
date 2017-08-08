#!/usr/bin/with-contenv /bin/bash

MYIP=$(hostname -i)
SYNCTHING_API_KEY=$(cat /.apikey)

exec s6-setuidgid "${RUN_USER}" syncthing -home="${SYNCTHING_HOME_DIRECTORY}" \
    -gui-address="${SYNCTHING_WEBUI_ADDRESS:-$MYIP}:${SYNCTHING_WEBUI_PORT}" -gui-apikey=${SYNCTHING_API_KEY} -no-browser
