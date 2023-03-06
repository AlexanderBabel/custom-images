# jellyfin

This repository contains a customized version of the [jellyfin/jellyfin](https://hub.docker.com/r/jellyfin/jellyfin) ([GitHub](https://github.com/jellyfin/jellyfin)) docker image. The image includes a modified frontend required for the skip intro button feature.

The source code for this feature can be found here: [ConfusedPolarBear/intro-skipper](https://github.com/ConfusedPolarBear/intro-skipper)

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new jellyfin version is released.

## Usage

You can pull the image by using
```bash
docker pull alexbabel/jellyfin:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/jellyfin:VERSION
```
