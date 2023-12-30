# x15

An example project to build Yocto for the BeagleBoard X15.

## To build

    $ docker build . -t $X15_IMAGE
    $ docker run -it -v $(pwd):/ws $X15_IMAGE
    > ./scripts/setup.sh
    > . layers/poky/oe-init-build-env
    > bitbake core-image-minimal

An SD card image can be found at

    build/tmp/deploy/images/beagle-x15/core-image-minimal-beagle-x15.wic.xz 

I needed to add a uEnv.txt to the first (boot) partition of the SD card

    mmcdev=0
    bootpart=0:1
    bootdir=
    args_mmc=run finduuid;setenv bootargs console=${console} ${optargs} root=/dev/mmcblk0p2 rw rootfstype=${mmcrootfstype}

## Customizing

You should be able to use a different machine name in `setup.sh` to build for a different Beagle family product.

    ~/ws/yocto-x15$ ls layers/meta-ti/meta-ti-bsp/conf/machine/beagle*
    layers/meta-ti/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
    layers/meta-ti/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
    layers/meta-ti/meta-ti-bsp/conf/machine/beaglebone.conf
    layers/meta-ti/meta-ti-bsp/conf/machine/beagle-x15.conf
