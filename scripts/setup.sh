#!/bin/bash

cd $(dirname $0)/..

mkdir -p x15/sources
git clone -b kirkstone git://git.yoctoproject.org/poky x15/sources/poky
git clone -b kirkstone git://git.yoctoproject.org/meta-arm x15/sources/meta-arm
git clone -b kirkstone git://git.yoctoproject.org/meta-ti x15/sources/meta-ti

mkdir -p x15/build/conf
cp conf/local.conf x15/build/conf/local.conf
cp conf/bblayers.conf x15/build/conf/bblayers.conf

