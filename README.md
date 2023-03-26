# custom-images

This mono repo includes custom docker images which are built to include custom extra components. Here is a quick overview of the software:

## Images

- [argocd](argocd) A tools for GitOps and CD for Kubernetes
- [jellyfin](jellyfin) A self hosted media server
- [maubot](maubot) A self hosted bot framework for Matrix
- [nextcloud](nextcloud) A self hosted cloud solution
- [owntone](owntone) A custom version of OwnTone with librespot-java for the [HomePod Connect Hass.io Addon](https://community.home-assistant.io/t/homepod-connect-spotify-on-homepods-with-spotify-connect)
- [synapse](synapse) A Matrix homeserver implementation

## Usage

You can pull a image by using
```bash
docker pull alexbabel/SOFTWARE:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/SOFTWARE:VERSION
```
