#!/bin/bash

/opt/erlang_app/generate_release.sh

name=$IMAGE_APP_NAME
tagName=$IMAGE_TAG_NAME

if [ -e "./Dockerfile" ];
then
  # Default TAG_NAME to package name if not set explicitly
  imageName="$name":${tagName:-latest}

  # Build the image from the Dockerfile in the package directory
  docker build -t $imageName .
fi
