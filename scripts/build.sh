#!/bin/bash

cd $(dirname $0)/..

. /ws/x15/sources/poky/oe-init-build-env /ws/x15/build
bitbake core-image-minimal
