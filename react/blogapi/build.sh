#!/usr/bin/env sh

set -x
npm --prefix /var/jenkins_home/workspace/django-react-nginx/react/blogapi run build
npm --prefix /var/jenkins_home/workspace/django-react-nginx/react/blogapi start &
sleep 1
echo $! > .pidfile
set +x
