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
        /tmp/*  \
    && apk add  -U --update --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing shairport-sync 

ADD https://github.com/librespot-org/librespot-java/releases/download/v${LIBRESPOT_VERSION}/librespot-api-${LIBRESPOT_VERSION}.jar /opt/librespot-java.jar 

COPY root/ /

LABEL \
  io.hass.arch="armhf|aarch64|i386|amd64" \
    io.hass.name="Shairport Sync_owntone" \
    io.hass.description="Shairport Sync owntone for Hass.io" \
    io.hass.type="addon" \
    io.hass.version="3.1" \
    maintainer="Maido Käära <m@maido.io>"