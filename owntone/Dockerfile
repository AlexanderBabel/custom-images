FROM ghcr.io/linuxserver/daapd:28.10-ls169

# renovate: datasource=github-releases depName=librespot-org/librespot-java
ENV LIBRESPOT_VERSION=1.6.4

RUN echo "**** install java and remove librespot ****" && \
    apk add -U --update --no-cache \
      openjdk11-jre && \
    apk del \
      librespot && \
    rm -r /etc/s6-overlay/s6-rc.d/user/contents.d/svc-librespot /etc/s6-overlay/s6-rc.d/svc-librespot

ADD https://github.com/librespot-org/librespot-java/releases/download/v${LIBRESPOT_VERSION}/librespot-api-${LIBRESPOT_VERSION}.jar /opt/librespot-java.jar
COPY root/ /

