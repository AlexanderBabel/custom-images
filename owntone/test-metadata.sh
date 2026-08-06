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

# Anything that is not a track change must stay silent.
noise=$(PLAYER_EVENT=volume_changed METADATA_PIPE="$PIPE" /usr/local/bin/librespot-metadata)
assert "ignores other events" "$noise" ""

rm -f "$PIPE"
echo "all good"
