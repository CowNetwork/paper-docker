#!/bin/bash

mcVersion=$(cat Paper/gradle.properties | sed -n '/mcVersion/p' | cut -c 11-)
commitSha=$(cd Paper && git rev-parse --short HEAD)
tag=$mcVersion-$commitSha

docker login ghcr.io -p $GHCR_TOKEN -u $GHCR_USER
docker build -t ghcr.io/caddle-party/paper:$tag .
docker push ghcr.io/caddle-party/paper:$tag
