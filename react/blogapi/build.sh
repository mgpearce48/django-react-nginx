#!/usr/bin/env sh

set -x
npm run build
npm start &
sleep 1
echo $! > .pidfile
set +x

input message: 'Finished reviewing the build stage? (Click "Proceed" to continue)'

set -x
kill $(cat .pidfile)
set +x
