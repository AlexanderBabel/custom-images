# nextcloud

This repository contains a customized version of [nextcloud](https://hub.docker.com/_/nextcloud) ([GitHub](https://github.com/nextcloud/server)). This image contains the `smbclient` compared to the upstream version.

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new nextcloud version is released.

## Usage

You can pull the image by using
```bash
docker pull alexbabel/nextcloud:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/nextcloud:VERSION
```
