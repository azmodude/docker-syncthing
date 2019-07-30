#!/bin/bash

#cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1 > /.apikey
# cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1
openssl rand -base64 64 > /.apikey


