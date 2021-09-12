#!/usr/bin/env bash
set -e
release=latest
docker build --tag uvoo/monitor-utils:$release .
#exit
docker login
docker push uvoo/monitor-utils:$release 
