# erlang-builder

[![](https://badge.imagelayers.io/artefactop/erlang-builder:latest.svg)](https://imagelayers.io/?images=artefactop/erlang-builder:latest 'Get your own badge on imagelayers.io')

Containerized build env for compiling an erlang application into a lightweight Docker container. Based on work of https://github.com/CenturyLinkLabs/golang-builder

## Requeriments

Create a `generate_release.sh` in your root application directory with instructions to make a release, for example:

```bash
#!/bin/bash
rebar get-deps clean compile generate
```

## Usage

Set up `IMAGE_APP_NAME` and `IMAGE_TAG_NAME` with your values

```bash
docker run --rm -v $(pwd):/opt/erlang_app -v /var/run/docker.sock:/var/run/docker.sock -v $DOCKER_CERT_PATH:/certs -e "DOCKER_HOST=$DOCKER_HOST" -e "DOCKER_CERT_PATH=/certs" -e "DOCKER_TLS_VERIFY=1" -e "IMAGE_APP_NAME=application_name" -e "IMAGE_TAG_NAME=tag" artefactop/erlang-builder
```