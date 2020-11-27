-include .env.mk

.env.mk: .env
		sed 's/"//g ; s/=/:=/' < $< > $@

.PHONY: all build push
.DEFAULT_GOAL := build

all: build push

up:
	/usr/bin/docker run \
		--name syncthing \
		--env RUN_UID=$(RUN_UID) \
		--env RUN_GID=$(RUN_GID) \
		--hostname syncthing-$(shell hostname -s) \
		--publish 127.0.0.1:8384:8384 \
		--publish $(SYNCTHING_LISTEN_PORT):$(SYNCTHING_LISTEN_PORT) \
		--publish $(SYNCTHING_BROADCAST_PORT):$(SYNCTHING_BROADCAST_PORT)/udp \
		--volume /etc/localtime:/etc/localtime:ro \
		--volume $(SYNCTHING_DIRECTORY):/syncthing \
		--volume $(SYNCTHING_DATA_DIRECTORY):/syncthing-data \
		--restart unless-stopped \
		$(IMAGE)
down:
	/usr/bin/docker stop syncthing
pull:
	/usr/bin/docker pull $(IMAGE)
build:
	/usr/bin/docker build -t $(IMAGE) \
		--pull .
push:
	/usr/bin/docker push $(IMAGE)
