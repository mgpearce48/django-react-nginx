#!/usr/bin/env sh

set -x
kill $(cat .pidfile)
set +x
