-include .env.mk

.env.mk: .env
		sed 's/"//g ; s/=/:=/' < $< > $@

.PHONY: all build push
.DEFAULT_GOAL := build

all: build push

up:
	sed -i 's/^SYNCTHING_HOSTNAME=.*$//SYNCTHING_HOSTNAME=$(shell hostname -s)/' .env
	sudo docker-compose up -d
down:
	sudo docker-compose down
build:
	sudo docker-compose build 
push:
	sudo docker push azmo/syncthing:latest