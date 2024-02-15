# postgres

This directory contains a customized version of [bitnami/postgresql](https://hub.docker.com/r/bitnami/postgresql) ([GitHub](https://github.com/bitnami/containers/tree/main/bitnami/postgresql)). This image contains the `vectors.rs` extension ([GitHub](https://github.com/tensorchord/pgvecto.rs)) compared to the upstream version.

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new postgres version is released.

## Usage

You can pull the image by using
```bash
docker pull alexbabel/postgres:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/postgres:VERSION
```
