FROM centos:7
RUN yum update -y
# General tools
RUN yum install -y wget unzip zip which
# Build tools 
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y gcc62 make gcc git cmake3 gmakectest ctest \
    && ln -s /usr/bin/cmake3 /usr/bin/cmake
# Dependencies
RUN yum install -y libX11-devel libXpm libXpm-devel libXft-devel libXext-devel
RUN yum groupinstall -y "Development tools"

# General build area
RUN mkdir /build && mkdir /build/build
RUN cd /build && git clone https://github.com/root-project/root.git
