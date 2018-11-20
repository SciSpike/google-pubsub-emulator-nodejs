#!/usr/bin/env bash

id="$(docker run -di scispike/google-pubsub-emulator-nodejs:$(grep 'LABEL version=' Dockerfile | cut -d'=' -f2))"
docker logs -f $id
