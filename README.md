# x15

A containerized yocto project intended for use with the [BeagleBoard-X15](https://beagleboard.org/x15).

## To build

    $ docker build . -t $X15_IMAGE
    $ docker run -it -v $(pwd):/ws $X15_IMAGE
    > ./scripts/fetch.sh          # Fetch layers
    > ./scripts/build.sh          # Build core-image-minimal
