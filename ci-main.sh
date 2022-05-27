#!/usr/bin/env bash
set -e

echo "Style check."
pip install flake8 && flake8 app.py

echo "Build and push docker container to Dockerhub."
release=latest
docker build --tag uvoo/monitor-utils:$release .
echo Push to docker repo in 5 seconds; sleep 5
echo $DOCKERHUB_TOKEN | docker login --username $DOCKERHUB_USERNAME --password-stdin
docker push uvoo/monitor-utils:$release
docker logout
