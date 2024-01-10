FROM alpine:3 as binary
RUN case "$(uname -m)" in \
        aarch64) export VECTORS_SUFFIX="arm64" ;; \
        x86_64) export VECTORS_SUFFIX="amd64" ;; \
    esac; \
    wget -O /tmp/vectors.deb https://github.com/tensorchord/pgvecto.rs/releases/download/v0.1.13/vectors-pg15_0.1.13_${VECTORS_SUFFIX}.deb

FROM bitnami/postgresql:15.2.0-debian-11-r11
COPY --from=binary /tmp/vectors.deb /tmp/vectors.deb
USER root
RUN apt-get install -y /tmp/vectors.deb && rm -f /tmp/vectors.deb && \
    mv /usr/lib/postgresql/*/lib/vectors.so /opt/bitnami/postgresql/lib/ && \
    mv usr/share/postgresql/*/extension/vectors* opt/bitnami/postgresql/share/extension/
USER 1001
ENV POSTGRESQL_EXTRA_FLAGS="-c shared_preload_libraries=vectors.so"
