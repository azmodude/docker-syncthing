#!/bin/bash

# if syncthing's webinterface is up we assume everything is fine
curl -s -o /dev/null -w "%{http_code}" --connect-timeout 2 \
    http://"${SYNCTHING_WEBUI_ADDRESS:-127.0.0.1}":"${SYNCTHING_WEBUI_PORT}"
