#!/usr/bin/env bash
set -x
ls -als /usr/lib/python2.7/plat-x86_64-linux-gnu/

if [ $# -ge 4 ]; then
  LABEL=$1 ; shift
  COMPILER=$1 ; shift
  BUILDTYPE=$1 ; shift
  BRANCH=$1 ; shift
else
  echo "$0: expecting 4 arguments [LABEL] [COMPILER] [BUILDTYPE] [BRANCH]"
  exit 1
fi

# Setup build env
cd /root-build

export CCACHE_DIR=/ccache
export JENKINS_HOME=/tmp
export EXTERNALS=docker

export MODE=experimental
export ExtraCMakeOptions='-Dccache=ON -DCMAKE_INSTALL_PREFIX=/usr/local/root -Dgnuinstall=ON'

export LABEL
export COMPILER
export BUILDTYPE

ls -als /usr/lib/python2.7/plat-x86_64-linux-gnu/
# Build
rootspi/jenkins/jk-all
ls -als /usr/lib/python2.7/plat-x86_64-linux-gnu/
# Install
# cmake -P build/cmake_install.cmake
ls -als /usr/lib/python2.7/plat-x86_64-linux-gnu/
# Cleanup
#rm -rf /root-build/build
#ls -als /usr/lib/python2.7/plat-x86_64-linux-gnu/

