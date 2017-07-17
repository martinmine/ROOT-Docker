FROM rootproject/root-ubuntu16-base

RUN mkdir /root-build \ 
# Clone repos
    && git clone https://github.com/root-project/root.git /root-build/root \ 
    && git clone https://github.com/root-project/rootspi.git /root-build/rootspi \ 
    && git clone https://github.com/root-project/roottest.git /root-build/roottest \ 
# Build
    && cd /root-build \ 
    && LABEL=ubuntu16 COMPILER=native BUILDTYPE=Release EXTERNALS=docker MODE=experimental JENKINS_HOME=/tmp rootspi/jenkins/jk-all \ 
# Install
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local/root -P build/cmake_install.cmake \
# Cleanup
    && cd / && rm -rf /root-build
    
CMD ["/bin/bash", "-c", "source /usr/local/root/bin/thisroot.sh && /usr/local/root/bin/root.exe"]
