FROM alpine:3 as binary
RUN case "$(uname -m)" in \
        aarch64) export VECTORS_SUFFIX="arm64" ;; \
        x86_64) export VECTORS_SUFFIX="amd64" ;; \
    esac; \
    wget -O /tmp/vectors.deb https://github.com/tensorchord/pgvecto.rs/releases/download/v0.2.0/vectors-pg15_0.2.0_${VECTORS_SUFFIX}.deb

FROM bitnami/postgresql:15.6.0-debian-12-r4
COPY --from=binary /tmp/vectors.deb /tmp/vectors.deb
USER root
RUN apt-get install -y /tmp/vectors.deb && rm -f /tmp/vectors.deb && \
    mv /usr/lib/postgresql/*/lib/vectors.so /opt/bitnami/postgresql/lib/ && \
    mv usr/share/postgresql/*/extension/vectors* opt/bitnami/postgresql/share/extension/
USER 1001
ENV POSTGRESQL_EXTRA_FLAGS="-c shared_preload_libraries=vectors.so"
