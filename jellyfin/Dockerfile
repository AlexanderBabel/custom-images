FROM --platform=$BUILDPLATFORM node:19 as build

WORKDIR /build

RUN git clone --depth 1 -b intros https://github.com/ConfusedPolarBear/jellyfin-web .

RUN npm ci && npm run build:production

FROM linuxserver/jellyfin:10.8.9-1-ls203

COPY --from=build /build/dist/ /usr/share/jellyfin/web/
