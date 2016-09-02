# erlang-builder

Containerized build environment for compiling an erlang application into a lightweight Docker container. Based on work of https://github.com/CenturyLinkLabs/golang-builder

## Requeriments

Create a `generate_release.sh` in your root application directory with instructions to make a release, for example:

```bash
#!/bin/bash
rebar get-deps clean compile generate
```

## Usage

Set up `IMAGE_APP_NAME` and `IMAGE_TAG_NAME` with your values

```bash
docker run --rm -v $(pwd):/opt/erlang_app -v --privileged "IMAGE_APP_NAME=application_name" -e "IMAGE_TAG_NAME=tag" artefactop/erlang-builder
```
