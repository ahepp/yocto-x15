#!/bin/bash

cd $(dirname $0)/..

if [[ -d /ws/sources ]] ; then
    git -C /ws/sources/poky pull
    git -C /ws/sources/meta-arm pull
    git -C /ws/sources/meta-ti pull
else 
    mkdir -p /ws/sources
    git clone -b kirkstone git://git.yoctoproject.org/poky     /ws/sources/poky
    git clone -b kirkstone git://git.yoctoproject.org/meta-arm /ws/sources/meta-arm
    git clone -b kirkstone git://git.yoctoproject.org/meta-ti  /ws/sources/meta-ti
fi
mkdir -p /ws/build/conf
cp conf/* /ws/build/conf/
