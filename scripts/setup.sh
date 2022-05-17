#!/bin/bash

cd $(dirname $0)/..

mkdir -p x15/sources
git clone -b kirkstone git://git.yoctoproject.org/poky x15/sources/poky
git clone -b kirkstone git://git.yoctoproject.org/meta-arm x15/sources/meta-arm
git clone -b kirkstone git://git.yoctoproject.org/meta-ti x15/sources/meta-ti
git clone -b kirkstone git://git.yoctoproject.org/meta-arago x15/sources/meta-arago
git clone -b kirkstone git://git.openembedded.org/meta-openembedded x15/sources/meta-openembedded
git clone -b kirkstone https://github.com/meta-qt5/meta-qt5 x15/sources/meta-qt5


mkdir -p x15/build/conf
cp conf/local.conf x15/build/conf/local.conf
cp conf/bblayers.conf x15/build/conf/bblayers.conf

