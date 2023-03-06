# matrix-synapse

This repository contains a customized version of [dock.mau.dev/maubot/maubot](https://mau.dev/maubot/maubot/container_registry) ([Gitlab](https://mau.dev/maubot/maubot/-/tree/master)). This image contains an extra pip package compared to the upstream version.

This package is `beautifulsoup4`.

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new maubot version is released.

## Usage

You can pull the image by using
```bash
docker pull alexbabel/maubot:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/maubot:VERSION
```
