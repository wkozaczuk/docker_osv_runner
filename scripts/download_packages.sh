#!/bin/bash

set -e

if [ "$1" == "" ]
then
  echo "Usage: download_packages.sh <package_name>|all <release_number>?"
  exit 1
fi

command -v curl || (echo "Install curl" && exit -1)

CAPSTAN_LOCAL_REPO=$HOME/.capstan
CAPSTAN_KERNEL_PATH=$CAPSTAN_LOCAL_REPO/repository/mike/osv-loader
CAPSTAN_PACKAGES_PATH=$CAPSTAN_LOCAL_REPO/packages

RELEASE_ARG=$2
RELEASE=${RELEASE_ARG:-"0.51.0"}

mkdir -p $CAPSTAN_KERNEL_PATH
mkdir -p $CAPSTAN_PACKAGES_PATH

download_package() {
  PACKAGE_NAME=$1
  curl -#L "https://github.com/cloudius-systems/osv/releases/download/v${RELEASE}/osv.${PACKAGE_NAME}.mpm" > $CAPSTAN_PACKAGES_PATH/osv.${PACKAGE_NAME}.mpm || exit
  curl -sL "https://github.com/cloudius-systems/osv/releases/download/v${RELEASE}/osv.${PACKAGE_NAME}.yaml" > $CAPSTAN_PACKAGES_PATH/osv.${PACKAGE_NAME}.yaml || exit
  echo "--> Downloaded package osv.${PACKAGE_NAME} into $CAPSTAN_PACKAGES_PATH"
}

download_kernel() {
  curl -#L "https://github.com/cloudius-systems/osv/releases/download/v${RELEASE}/osv-loader.qemu" > $CAPSTAN_KERNEL_PATH/osv-loader.qemu || exit
  curl -sL "https://github.com/cloudius-systems/osv/releases/download/v${RELEASE}/index.yaml" > $CAPSTAN_KERNEL_PATH/index.yaml || exit
  echo "--> Downloaded OSv kernel into $CAPSTAN_KERNEL_PATH"
}

case "$1" in
  all)
    echo "Downloading OSv unikernel and all packages ..."
    download_kernel
    download_package bootstrap
    download_package run-java
    download_package run-go
    download_package node-js
    download_package openjdk10-java-base
    download_package httpserver-api
    download_package httpserver-html5-gui
    download_package httpserver-html5-cli
    download_package cli
    download_package lighttpd
    download_package nginx
    download_package iperf
    download_package netperf
    download_package redis-memonly
    download_package memcached
    download_package mysql;;
  kernel)
    echo "Downloading OSv kernel ..."
    download_kernel;;
  bootstrap|run-java|run-go|node|openjdk10-java-base|httpserver-api|\
  httpserver-html5-gui|httpserver-html5-cli|cli|lighttpd|nginx|iperf|netperf|redis-memonly|memcached|mysql)
    echo "Downloading package $1 ..."
    download_package $1;;
  *)
    echo "Unrecognised package to download!"
esac
