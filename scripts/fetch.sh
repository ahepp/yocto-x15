#!/bin/bash

cd $(dirname $0)/..

if [[ -d /ws/x15/sources ]] ; then
    git -C /ws/x15/sources/poky pull
    git -C /ws/x15/sources/meta-arm pull
    git -C /ws/x15/sources/meta-ti pull
else 
    mkdir -p /ws/x15/sources
    git clone -b kirkstone git://git.yoctoproject.org/poky     /ws/x15/sources/poky
    git clone -b kirkstone git://git.yoctoproject.org/meta-arm /ws/x15/sources/meta-arm
    git clone -b kirkstone git://git.yoctoproject.org/meta-ti  /ws/x15/sources/meta-ti
fi
mkdir -p /ws/x15/build/conf
cp conf/* /ws/x15/build/conf/
