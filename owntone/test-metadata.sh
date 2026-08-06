#!/bin/sh
# Checks that the --onevent hook emits metadata OwnTone can actually parse.
# Run inside the image: docker run --rm -v "$PWD/test-metadata.sh:/t.sh" IMAGE /t.sh
set -eu

PIPE=/tmp/test.metadata
rm -f "$PIPE"
mkfifo "$PIPE"

METADATA_PIPE="$PIPE" \
PLAYER_EVENT=track_changed \
NAME="Weightless" \
ARTISTS="Marconi Union
Someone Else" \
ALBUM="Ambient Transmissions" \
COVERS="" \
	/usr/local/bin/librespot-metadata &

out=$(cat "$PIPE")
wait

decode() { # <code hex> -> the decoded payload for that item
	printf '%s' "$out" |
		tr -d '\n' |
		sed -n "s/.*<code>$1<\/code><length>[0-9]*<\/length><data encoding=\"base64\">\([^<]*\)<\/data>.*/\1/p" |
		base64 -d
}

assert() {
	[ "$2" = "$3" ] || { echo "FAIL: $1 = '$2', expected '$3'"; exit 1; }
	echo "ok: $1 = '$2'"
}

assert title "$(decode 6d696e6d)" "Weightless"
assert artist "$(decode 61736172)" "Marconi Union"
assert album "$(decode 6173616c)" "Ambient Transmissions"

volume() { # <librespot volume 0-65535> -> what OwnTone gets to parse
	METADATA_PIPE="$PIPE" PLAYER_EVENT=volume_changed VOLUME="$1" \
		/usr/local/bin/librespot-metadata &
	out=$(cat "$PIPE")
	wait
	decode 70766f6c
}

# OwnTone reads -30..0 dB as 0-100% and only accepts the trailing zeroes.
assert "full volume" "$(volume 65535)" "0.00,0.00,0.00,0.00"
assert "half volume" "$(volume 32768)" "-15.00,0.00,0.00,0.00"
assert "muted" "$(volume 0)" "-144.00,0.00,0.00,0.00"

# Anything else must stay silent.
noise=$(PLAYER_EVENT=playing METADATA_PIPE="$PIPE" /usr/local/bin/librespot-metadata)
assert "ignores other events" "$noise" ""

rm -f "$PIPE"
echo "all good"
