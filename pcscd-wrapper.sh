#!/bin/sh
pcscd &
sleep 2
chmod 666 /run/pcscd/pcscd.comm 2>/dev/null || true

# Execute original entrypoint if it existed, otherwise run passed commands
exec /usr/local/bin/docker-entrypoint.sh.orig "$@"