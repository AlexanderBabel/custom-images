# argocd

This repository contains a customized version of [argoproj/argo-cd](https://github.com/argoproj/argo-cd). This image contains [sops](https://github.com/mozilla/sops) and the [helm-secrets](https://github.com/jkroepke/helm-secrets) plugin compared to the upstream version.

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new argocd version is released.

## Usage

You can pull the image by using
```bash
docker pull alexbabel/argocd:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/argocd:VERSION
```
