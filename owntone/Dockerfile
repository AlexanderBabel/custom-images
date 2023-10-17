

FROM ghcr.io/linuxserver/daapd:28.8-ls122 AS owntone


# renovate: datasource=github-releases depName=librespot-org/librespot-java
ENV LIBRESPOT_VERSION=1.6.3
ARG BASHIO_VERSION="v0.15.0"

RUN echo "**** install java and remove librespot ****" && \
    apk add -U --update --no-cache \
      openjdk11-jre && \  
    apk del \
      librespot && \
    rm -r /etc/s6-overlay/s6-rc.d/user/contents.d/svc-librespot /etc/s6-overlay/s6-rc.d/svc-librespot && \
   curl -J -L -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf \
        /tmp/bashio.tar.gz \
        --strip 1 -C /tmp/bashio \
    \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -f -r \
        /tmp/* 

ADD https://github.com/librespot-org/librespot-java/releases/download/v${LIBRESPOT_VERSION}/librespot-api-${LIBRESPOT_VERSION}.jar /opt/librespot-java.jar

#FROM alpine:3.18
FROM ghcr.io/linuxserver/baseimage-alpine:3.18 AS sps

#RUN apk add  -U --update --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing shairport-sync 

RUN apk -U add \
        #alsa-lib-dev \
        autoconf \
        automake \
        avahi-dev \
        build-base \
        #dbus \
        ffmpeg-dev \
        git \
        libconfig-dev \
        libgcrypt-dev \
        libplist-dev \
        libressl-dev \
        libsndfile-dev \
        libsodium-dev \
        libtool \
     #   mosquitto-dev \
        popt-dev \
        pulseaudio-dev \
        soxr-dev \
        xxd

RUN cd /root \
 && git clone https://github.com/mikebrady/shairport-sync.git \
 && cd shairport-sync \
 && autoreconf -i -f \
 && ./configure \
		    --prefix=/usr \
		    --sysconfdir=/etc \
        --with-pipe \
        --with-pa \
        --with-avahi \
        --with-ssl=openssl \
        --with-soxr \
        --with-metadata \
        #--with-mqtt-client \
        --with-convolution \
       #  --with-apple-alac \
 && make \
 && make install \
 && cd / \
 && apk --purge del \
        git \
        build-base \
        autoconf \
        automake \
        libtool \
        alsa-lib-dev \
        libdaemon-dev \
        popt-dev \
        libressl-dev \
        soxr-dev \
        avahi-dev \
        libconfig-dev \
 && apk add \
       # dbus \
        #alsa-lib \
        #alsa-plugins-pulse \
        #libdaemon \
        popt \
        libressl \
        soxr \
        #avahi \
        libconfig \
        #mosquitto \
 && rm -rf \
        /etc/ssl \
        /var/cache/apk/* \
        /lib/apk/db/* \
        /root/shairport-sync        

COPY --from=owntone / /
COPY root/ /


#FROM ghcr.io/hassio-addons/base:14.2.0

#RUN apk -U add \
#        alsa-lib 

#COPY --from=sps / /   
#COPY / /     

# ports and volumes
EXPOSE 5000

LABEL \
  io.hass.arch="armhf|aarch64|i386|amd64" \
    io.hass.name="Shairport Sync_owntone" \
    io.hass.description="Shairport Sync owntone for Hass.io" \
    io.hass.type="addon" \
    io.hass.version="3.1" \
    maintainer="Maido Käära <m@maido.io>"