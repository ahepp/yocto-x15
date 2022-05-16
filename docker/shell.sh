#!/bin/bash

cd $(dirname $0)/..
. docker/env
docker run --rm -it -v $X15_PATH:/ws -v $X15_VOLUME:/ws/x15 -w /ws --hostname $X15_IMAGE $X15_IMAGE
