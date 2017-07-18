#!/usr/bin/env bash

if [ $# -ge 4 ]; then
  LABEL=$1 ; shift
  COMPILER=$1 ; shift
  BUILDTYPE=$1 ; shift
  BRANCH=$1 ; shift
else
  echo "$0: expecting 4 arguments [LABEL] [COMPILER] [BUILDTYPE] [BRANCH]"
  exit 1
fi

# Build environment
mkdir /root-build
# Clone repos
git clone https://github.com/root-project/rootspi.git /root-build/rootspi
git clone https://github.com/root-project/root.git -b $BRANCH /root-build/root
git clone https://github.com/root-project/roottest.git -b $BRANCH /root-build/roottest
# Build
cd /root-build
#LABEL=ubuntu16 COMPILER=native BUILDTYPE=Release EXTERNALS=docker MODE=experimental JENKINS_HOME=/tmp rootspi/jenkins/jk-all
# Install
#cmake -DCMAKE_INSTALL_PREFIX=/usr/local/root -P build/cmake_install.cmake
# Cleanup
cd / && rm -rf /root-build