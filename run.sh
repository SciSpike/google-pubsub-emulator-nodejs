#!/usr/bin/env bash

PUBSUB_PORT=${PUBSUB_PORT:-8085}
gcloud beta emulators pubsub start --host-port 0.0.0.0:${PUBSUB_PORT} &
until nc -zv localhost ${PUBSUB_PORT} &>/dev/null; do :; done
node /init.js
tail -f /dev/null
