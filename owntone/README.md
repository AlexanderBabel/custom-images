# HomePod Connect Docker Image

This is the offical Docker image of the Home Assistant add-on [HomePod Connect](https://community.home-assistant.io/t/homepod-connect-spotify-on-homepods-with-spotify-connect/482227). You can also use it by itself on other systems. It works out of the box with zeroconf and can be discovered inside your local network.

## Difference to linuxserver/daapd

This repository contains a customized version of [linuxserver/daapd](https://github.com/linuxserver/docker-daapd). In this image librespot is replaced by [librespot-java](https://github.com/librespot-org/librespot-java) and openjdk11-jre is installed. Also a custom [OwnTone](https://github.com/owntone/owntone-server) and [librespot-java](https://github.com/librespot-org/librespot-java) configuration is provided.

In addition, [Shairport Sync](https://github.com/mikebrady/shairport-sync)
is installed and can be optionally enabled on the configuration page to provide either or both these Airplay instances:

1. An Airplay instance that will pipe audio and metadata to Owntone for whole house audio from any source that can play to an Airplay 1 device. This Airplay instance is hidden from OwnTone so it does not pipe back to OwnTone.

2. An Airplay instance that will play to the audio device of the Home Assistant host.

The changes can be viewed inside the `Dockerfile`. 

This image is built automatically when a new linuxserver/daapd or Shairport Sync version is released.

## Usage

You can pull the image by using
```bash
docker pull alexbabel/owntone:VERSION
```
or use GHCR:
```bash
docker pull ghcr.io/alexanderbabel/owntone:VERSION
```

Run the image:
```bash
docker run --network=host -v $(pwd)/config:/config/owntone alexbabel/owntone:VERSION
```

## Access
You can access the OwnTone instance on the default port (3689).

## Configuration
All configuration files are stored inside the docker image in `/config/owntone`. There, you can find multple files:

- [`librespot-java.toml`](https://github.com/AlexanderBabel/owntone/blob/main/root/defaults/librespot-java.toml) - Configuration for [librespot-java](https://github.com/librespot-org/librespot-java)
- [`owntone.conf`](https://github.com/AlexanderBabel/owntone/blob/main/root/defaults/owntone.conf) - Configuration for [OwnTone](https://github.com/owntone/owntone-server)
- [`shairport-sync-pipe.conf`](https://github.com/AlexanderBabel/owntone/blob/main/root/defaults/shairport-sync-pipe.conf) - Configuration for [Shairport Sync](https://github.com/mikebrady/shairport-sync)
- [`shairport-sync-audio.conf`](https://github.com/AlexanderBabel/owntone/blob/main/root/defaults/shairport-sync-audio.conf) - Configuration for [Shairport Sync](https://github.com/mikebrady/shairport-sync)

All files are adjusted to work out of the box as a Spotify Connect speaker. The content of these files can be found in this repository.

The configuration page allows you to enable/disable the Airplay instances, name them them, change the tcp/udp port if needed, and choose from two logging levels.

Also on the configuration page, the [librespot-java](https://github.com/librespot-org/librespot-java) cache can be enabled/disabled and the Home Assistant audio device can be chosen.
