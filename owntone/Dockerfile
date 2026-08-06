FROM owntone/owntone:29.3

# librespot only lives in Alpine's edge/testing repo for now. Unpinned on
# purpose: pinning a testing version just swaps silent upgrades for builds that
# break once edge drops the release.
# ponytail: move to the regular repos as soon as librespot lands in community.
RUN apk add --no-cache \
      --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
      librespot && \
    # linuxserver/daapd ran OwnTone as "abc" (uid 911) and existing add-on
    # installs still carry that in their owntone.conf, so keep the user.
    adduser -D -H -u 911 abc && \
    mkdir -p /etc/owntone /music

COPY root/ /

RUN rc-update add owntone-init default && \
    rc-update add librespot default
