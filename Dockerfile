FROM ubuntu:14.10
MAINTAINER Jose L. Navarro <jlnavarro111@gmail.com>

VOLUME /opt/erlang_app
WORKDIR /opt/erlang_app

# install required packages
RUN apt-get update && apt-get install -y \
   git \
   curl \
   wget \
   make \
   gcc \
   libc6-dev \
   libncurses5-dev \
   libssl-dev \
   libexpat1-dev \
   libpam0g-dev

# To install docker, run the following command as root:
RUN curl -sSL -O https://get.docker.com/builds/Linux/x86_64/docker-1.7.1 \
  && chmod +x docker-1.7.1 \
  && sudo mv docker-1.7.1 /usr/local/bin/docker

# add esl packages
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
    && dpkg -i erlang-solutions_1.0_all.deb \
    && wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc\
    && apt-key add erlang_solutions.asc \
    && apt-get update \
    && apt-get install -y \
        erlang=1:17.5.3 erlang-base-hipe=1:17.5.3 erlang-dev=1:17.5.3 erlang-appmon=1:17.5.3 \
        erlang-asn1=1:17.5.3 erlang-common-test=1:17.5.3 erlang-corba=1:17.5.3 erlang-crypto=1:17.5.3 erlang-debugger=1:17.5.3 \
        erlang-dialyzer=1:17.5.3 erlang-edoc=1:17.5.3 erlang-erl-docgen=1:17.5.3 erlang-et=1:17.5.3 erlang-eunit=1:17.5.3 \
        erlang-gs=1:17.5.3 erlang-ic=1:17.5.3 erlang-inets=1:17.5.3 erlang-inviso=1:17.5.3 erlang-megaco=1:17.5.3 \
        erlang-mnesia=1:17.5.3 erlang-observer=1:17.5.3 erlang-odbc=1:17.5.3 erlang-os-mon=1:17.5.3 erlang-parsetools=1:17.5.3 \
        erlang-percept=1:17.5.3 erlang-pman=1:17.5.3 erlang-public-key=1:17.5.3 erlang-reltool=1:17.5.3 \
        erlang-runtime-tools=1:17.5.3 erlang-snmp=1:17.5.3 erlang-ssh=1:17.5.3 erlang-ssl=1:17.5.3 erlang-syntax-tools=1:17.5.3 \
        erlang-test-server=1:17.5.3 erlang-toolbar=1:17.5.3 erlang-tools=1:17.5.3 erlang-tv=1:17.5.3 erlang-typer=1:17.5.3 \
        erlang-webtool=1:17.5.3 erlang-wx=1:17.5.3 erlang-xmerl=1:17.5.3 erlang-diameter=1:17.5.3 erlang-eldap=1:17.5.3

ADD ./entrypoint.sh /

# compile source
ENTRYPOINT ["/entrypoint.sh"]


