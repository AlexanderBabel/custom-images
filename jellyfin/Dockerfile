FROM node:18 as build

WORKDIR /build

RUN git clone --depth 1 -b intros https://github.com/ConfusedPolarBear/jellyfin-web .

RUN npm ci && npm run build:production

FROM jellyfin/jellyfin:10.8.9

COPY --from=build /build/dist/ /jellyfin/jellyfin-web/

