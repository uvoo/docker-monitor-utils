#!/usr/bin/env bash
set -e
echo $DOCKERHUB_TOKEN | docker login --username $DOCKERHUB_USERNAME --password-stdin
echo "Hello world"