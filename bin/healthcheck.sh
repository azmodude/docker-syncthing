#!/usr/bin/with-contenv /bin/bash
curl -s --connect-timeout 2 http://${SYNCTHING_WEBUI_ADDRESS:-127.0.0.1}:{SYNCTHING_WEBUI_PORT}
