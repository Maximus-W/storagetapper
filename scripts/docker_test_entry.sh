#!/bin/bash

set -ex

export GOPATH=$HOME/gopath
export PATH=$HOME/gopath/bin:/usr/local/go/bin:$PATH
export STORAGTAPPER_CONFIG_DIR=$(pwd)/storagetapper/config
export STORAGETAPPER_ENVIRONMENT="test"

/bin/sh scripts/prepare_test_env.sh

P=$GOPATH/src/github.com/uber
mkdir -p $P
cp -ap /storagetapper $P
cd $P/storagetapper

make test
