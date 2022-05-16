#!/bin/bash

cd $(dirname $0)/..
. docker/env
docker build docker/ -t $X15_IMAGE
