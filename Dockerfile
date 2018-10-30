#
# Copyright (C) 2017 XLAB, Ltd.
# Copyright (C) 2018 Waldemar Kozaczuk
#
# This work is open source software, licensed under the terms of the
# BSD license as described in the LICENSE file in the top-level directory.
#
# This Docker file defines a container intended to demonstrate running 
# applications on OSv unikernel
#
FROM ubuntu:18.10

ENV DEBIAN_FRONTEND noninteractive
ENV TERM=linux

COPY ./etc/keyboard /etc/default/keyboard
COPY ./etc/console-setup /etc/default/console-setup

RUN apt-get update -y && apt-get install -y \
curl \
qemu-system-x86 \
qemu-utils \
git \
wget && apt-get autoremove && apt-get clean

#
# PREPARE ENVIRONMENT
#
# - build Mikelangelo Capstan
RUN cd /tmp && wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
RUN cd /tmp && tar -xf go1.11.linux-amd64.tar.gz && mv go /usr/local && mkdir $HOME/go

ENV GOROOT=/usr/local/go
ENV GOPATH=$HOME/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN go get github.com/mikelangelo-project/capstan
RUN cd $GOPATH/src/github.com/mikelangelo-project/capstan && go build .

# Copy capstan apps
WORKDIR /capstan-apps
COPY ./apps/ /capstan-apps/

# Download latest OSv kernel and packages
RUN mkdir /scripts
COPY ./scripts/* /scripts/
RUN /scripts/download_packages.sh all

CMD /bin/bash

#
# NOTES
#
# Build this container with:
# docker build -t osv/runner .
#
# Run this container with:
# docker run -it --privileged osv/runner
