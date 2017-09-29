#!/usr/bin/with-contenv /bin/bash

>&2 echo "Adding '${RUN_USER}' with UID ${RUN_UID} and group '${RUN_GROUP}' with GID ${RUN_GID}."
groupadd -g $RUN_GID $RUN_GROUP || true && \
    useradd -c 'Run User' -s /bin/bash -m -g $RUN_GID -u $RUN_UID $RUN_USER || true
>&2 echo "Fixing Permissions."
chown -R ${RUN_UID}:${RUN_GID} "${SYNCTHING_HOME_DIRECTORY}"
chown ${RUN_UID}:${RUN_GID} "${SYNCTHING_DATA_DIRECTORY}"
