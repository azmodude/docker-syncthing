#!/usr/bin/with-contenv /bin/bash

>&2 echo "adding 'syncthing' with UID ${RUN_UID} and group 'syncthing' with GID ${RUN_GID}"
groupadd -g "${RUN_GID}" syncthing || true && \
    useradd -c 'Run User' -s /bin/bash -m -g "${RUN_GID}" -u "${RUN_UID}" syncthing || true
>&2 echo "fixing permissions"
chown -R ${RUN_UID}:${RUN_GID} "${SYNCTHING_HOME_DIRECTORY}"
chown ${RUN_UID}:${RUN_GID} "${SYNCTHING_DATA_DIRECTORY}"
