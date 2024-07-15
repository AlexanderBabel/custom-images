FROM alpine/helm:3.15.3 as build

RUN helm plugin install https://github.com/jkroepke/helm-secrets --version v4.6.0

RUN case "$(uname -m)" in \
        aarch64) export SOPS_SUFFIX="arm64" ;; \
        x86_64) export SOPS_SUFFIX="amd64" ;; \
    esac; \
    wget -O /usr/bin/sops https://github.com/mozilla/sops/releases/download/v3.8.1/sops-v3.8.1.linux.$SOPS_SUFFIX

COPY wrapper.sh /usr/bin/wrapper.sh

RUN chown -R 999:999 \
        /usr/bin/wrapper.sh \
        /usr/bin/helm \
        /usr/bin/sops \
        /root/.local/share/helm/plugins/ && \
    chmod -R 755 \
        /usr/bin/wrapper.sh \
        /usr/bin/helm \
        /usr/bin/sops \
        /root/.local/share/helm/plugins/

FROM quay.io/argoproj/argocd:v2.11.5

ENV ARGOCD_EXEC_TIMEOUT=5m
ENV HELM_PLUGINS=/home/argocd/.local/share/helm/plugins/

COPY --from=build /usr/bin/sops /usr/local/bin/sops
COPY --from=build /usr/bin/helm /usr/local/bin/helm.bin
COPY --from=build /usr/bin/wrapper.sh /usr/local/bin/helm
COPY --from=build /root/.local/share/helm/plugins/ /home/argocd/.local/share/helm/plugins/

