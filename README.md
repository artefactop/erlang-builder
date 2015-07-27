# erlang-builder
Containerized build env for compiling an erlang application into a lightweight Docker container. Based on work of https://github.com/CenturyLinkLabs/golang-builder

## Requeriments

Create a `generate_release.sh` in your root application directory with instructions to make a release, for example:

```bash
#!/bin/bash
rebar get-deps clean compile generate
```

## Usage
```bash
docker run --rm -v $(pwd):/opt/erlang_app -v /var/run/docker.sock:/var/run/docker.sock -v $DOCKER_CERT_PATH:/certs -e "DOCKER_HOST=$DOCKER_HOST" -e "DOCKER_CERT_PATH=/certs" -e "DOCKER_TLS_VERIFY=1" -e "IMAGE_APP_NAME=application_name" artefactop/erlang-builder
```