FROM centos:7
RUN yum update -y \
# General tools
    && yum install -y wget unzip zip which \ 
# Build tools 
    && rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \ 
    && yum install -y gcc62 make gcc git cmake3 gmakectest ctest \
    && ln -s /usr/bin/cmake3 /usr/bin/cmake \ 
# Dependencies
    && yum install -y libX11-devel libXpm libXpm-devel libXft-devel libXext-devel \ 
    && yum groupinstall -y "Development tools" \ 
# General build area
    && mkdir /root-build && mkdir /root-build/build \ 
# Clone repos
    && git clone https://github.com/root-project/root.git /root-build/root \ 
    && git clone https://github.com/root-project/rootspi.git /root-build/rootspi \ 
    && git clone https://github.com/root-project/roottest.git /root-build/root
# Build ROOT
#    && LABEL=centos7 COMPILER=gcc62 BUILDTYPE=release EXTERNALS=docker BUILDTYPE=experimental /root-build/rootspi/jenkins/jk-all

RUN    cd /root-build/build && cmake ../root

# Start ROOT when 
CMD /root-build/build/bin/root.exe
