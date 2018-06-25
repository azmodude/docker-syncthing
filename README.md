# docker-syncthing

A very basic [Syncthing](https://syncthing.net/) docker image - mostly built for personal use.

## usage

- Adjust variables in `.env` accordingly.
- `make up` will automatically adjust `SYNCTHING_HOSTNAME` in .env to match current machine's hostname
- If `SYNCTHING_WEBUI_ADDRESS` is not set, syncthing will only be available on the local machine (or ssh forwarding)
