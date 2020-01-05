#!/usr/bin/with-contenv /bin/bash

USER_HOME=/syncthing-data

>&2 echo "adding runuser with UID ${RUN_UID} and group with GID ${RUN_GID}"
groupadd -g "${RUN_GID}" rungroup || true && \
    useradd -c 'Run User' -s /bin/bash -M -d "${USER_HOME}" -g "${RUN_GID}" -u "${RUN_UID}" runuser || true
>&2 echo "fixing permissions"
chown -R "${RUN_UID}:${RUN_GID}" /syncthing
find /syncthing -type f -exec chmod 600 '{}' \;
find /syncthing -type d -exec chmod 700 '{}' \;
chown "${RUN_UID}:${RUN_GID}" /syncthing-data
