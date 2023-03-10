# x15

An example project to build Yocto for the BeagleBoard X15.

## To build

    $ docker build . -t $X15_IMAGE
    $ docker run -it -v $(pwd):/ws $X15_IMAGE
    > ./setup.sh
    > . layers/poky/oe-init-build-env
    > bitbake core-image-minimal

