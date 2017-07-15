FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
             make g++ gcc cmake git libx11-dev libxpm-dev libxft-dev libxext-dev python lsb-release locales libxml2-dev python-dev libgsl0-dev \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -f UTF-8 en_US.UTF-8 \
# General build area
    && mkdir /root-build \ 
# Clone repos
    && git clone https://github.com/root-project/root.git /root-build/root \ 
    && git clone https://github.com/root-project/rootspi.git /root-build/rootspi \ 
    && git clone https://github.com/root-project/roottest.git /root-build/roottest \ 
# Build ROOT
    && cd /root-build \ 
    && LABEL=ubuntu16 COMPILER=native BUILDTYPE=Release EXTERNALS=docker MODE=experimental JENKINS_HOME=/tmp rootspi/jenkins/jk-all
# TODO: Install & cleanup stuff

CMD /root-build/build/bin/root.exe
