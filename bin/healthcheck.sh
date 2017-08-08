#!/usr/bin/with-contenv /bin/bash
curl -s --connect-timeout 2 http://localhost:${SYNCTHING_WEBUI_PORT}
