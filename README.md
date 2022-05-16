# x15

A containerized yocto project intended for use with the [BeagleBoard-X15](https://beagleboard.org/x15).

## Before building

Create a file `docker/env` defining the environment variables:

* `X15_IMAGE` name to use for tagging the build environment image
* `X15_VOLUME` name of volume to use for source and build artifacts
* `X15_PATH` absolute path to project directory

## To build

For the initial setup:

    $ cat docker/env
    X15_IMAGE="x15-dev"
    X15_VOLUME="x15-build"
    X15_PATH="/Users/ahepp/ws/x15"
    $ ./docker/build.sh
    $ ./docker/shell.sh
    > ./scripts/setup.sh
    > . x15/sources/poky/oe-init-build-env build/
    > bitbake core-image-minimal

After initial setup, one can re-enter the build environment with:

    $ ./docker/shell.sh
    > . x15/sources/poky/oe-init-build-env build/
    > bitbake core-image-minimal
