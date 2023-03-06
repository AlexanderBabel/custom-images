FROM ghcr.io/linuxserver/daapd:28.5-ls100

# renovate: datasource=github-releases depName=librespot-org/librespot-java
ENV LIBRESPOT_VERSION=1.6.2

RUN echo "**** install java and remove librespot ****" && \
    apk add -U --update --no-cache \
      openjdk11-jre && \
    apk del \
      librespot && \
    rm -r /etc/services.d/librespot

ADD https://github.com/librespot-org/librespot-java/releases/download/v${LIBRESPOT_VERSION}/librespot-api-${LIBRESPOT_VERSION}.jar /opt/librespot-java.jar
COPY root/ /
