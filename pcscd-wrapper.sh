#!/bin/sh
pcscd &
sleep 1
exec docker-entrypoint.sh "$@"