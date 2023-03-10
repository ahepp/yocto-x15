#!/bin/bash

cd $(dirname $0)/..
git submodule update --init
. layers/poky/oe-init-build-env
bitbake-layers add-layer ../layers/meta-arm/meta-arm-toolchain
bitbake-layers add-layer ../layers/meta-arm/meta-arm
bitbake-layers add-layer ../layers/meta-ti/meta-ti-bsp

echo MACHINE=\"beagle-x15\" >> conf/local.conf
