FROM alpine/helm:3.8.0 as build

RUN helm plugin install https://github.com/jkroepke/helm-secrets --version v3.12.0

RUN wget -O /usr/bin/sops https://github.com/mozilla/sops/releases/download/v3.7.2/sops-v3.7.2.linux.arm64

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

FROM quay.io/argoproj/argocd:v2.3.3

COPY --from=build /usr/bin/sops /usr/local/bin/sops
COPY --from=build /usr/bin/helm /usr/local/bin/helm.bin
COPY --from=build /usr/bin/wrapper.sh /usr/local/bin/helm
COPY --from=build /root/.local/share/helm/plugins/ /home/argocd/.local/share/helm/plugins/
