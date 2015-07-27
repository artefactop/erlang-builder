#!/bin/bash

/opt/erlang_app/generate_release.sh

name=$IMAGE_APP_NAME
tagName=$IMAGE_TAG_NAME

if [ -e "/var/run/docker.sock" ] && [ -e "./Dockerfile" ];
then
  # Default TAG_NAME to package name if not set explicitly
  tagName=${tagName:-"$name":latest}

  # Build the image from the Dockerfile in the package directory
  docker build -t $tagName .
fi