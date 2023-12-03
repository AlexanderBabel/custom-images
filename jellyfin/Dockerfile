FROM --platform=$BUILDPLATFORM node:20 as build

WORKDIR /build

ARG BRANCH=release-10.8.z

RUN git clone --depth 1 -b "$BRANCH" https://github.com/jellyfin/jellyfin-web .

ADD https://github.com/jellyfin/jellyfin-web/compare/${BRANCH}...ConfusedPolarBear:jellyfin-web:intros.patch intros.patch

RUN git apply intros.patch

RUN npm ci && npm run build:production

FROM ghcr.io/linuxserver/jellyfin:10.8.12-1-ls235

COPY --from=build /build/dist/ /usr/share/jellyfin/web/
