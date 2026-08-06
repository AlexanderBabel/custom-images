# HomePod Connect Docker Image

This is the official Docker image of the Home Assistant add-on [HomePod Connect](https://community.home-assistant.io/t/homepod-connect-spotify-on-homepods-with-spotify-connect/482227). You can also use it by itself on other systems. It works out of the box with zeroconf and can be discovered inside your local network.

## Difference to owntone/owntone

This image adds [librespot](https://github.com/librespot-org/librespot) to the [official OwnTone container](https://github.com/owntone/owntone-container). librespot appears on the network as a Spotify Connect speaker and writes the audio into a named pipe (`/music/Spotify`) that OwnTone plays, which lets you send Spotify to HomePods over AirPlay.

Both run as OpenRC services, the same supervisor the base image already uses for OwnTone, avahi and dbus.

Track title, artist, album and cover art are forwarded to OwnTone by `librespot-metadata`, a `--onevent` hook that writes Shairport Sync style metadata into `/music/Spotify.metadata`.

The changes can be viewed inside the `Dockerfile`.

> Before OwnTone 29 this image was based on `linuxserver/daapd` and used librespot-java. LinuxServer deprecated that image, and librespot-java has had no release since the Spotify API changes of 2025.

## Usage

```bash
docker pull ghcr.io/alexanderbabel/owntone:VERSION
```

Run the image:
```bash
docker run --network=host -v $(pwd)/config:/config ghcr.io/alexanderbabel/owntone:VERSION
```

## Access
You can access the OwnTone instance on the default port (3689).

## Configuration
Configuration lives in `/config/owntone`, seeded on first start and never overwritten afterwards:

- [`owntone.conf`](root/defaults/owntone.conf) - configuration for [OwnTone](https://github.com/owntone/owntone-server). The fully commented reference config ships in the image at `/usr/share/doc/owntone/examples/owntone.conf`.
- [`librespot.conf`](root/defaults/librespot.conf) - device name and extra flags for [librespot](https://github.com/librespot-org/librespot).

Both files work out of the box as a Spotify Connect speaker. Restart the container after changing them.

## Tests

```bash
docker build -t owntone .
docker run --rm -v "$PWD/test-metadata.sh:/t.sh:ro" --entrypoint sh owntone /t.sh
```
