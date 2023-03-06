# matrix-synapse

This repository contains a customized version of [matrixdotorg/synapse](https://hub.docker.com/r/matrixdotorg/synapse) ([GitHub](https://github.com/matrix-org/synapse)). This image contains two pip packages compared to the upstream version.

These two packages are `synapse-s3-storage-provider` and `shared-secret-authenticator`.

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new synapse version is released.

## Usage

You can pull the image by using
```bash
docker pull alexbabel/synapse:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/synapse:VERSION
```
