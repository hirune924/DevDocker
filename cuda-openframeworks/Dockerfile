FROM nvidia/cuda:10.0-devel-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER "@hirune924"


ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

# https://openframeworks.cc/ja/download/
# https://openframeworks.cc/ja/setup/linux-install/
# https://forum.openframeworks.cc/t/cannot-compile-of-errors-on-of3dprimitives-and-conflicting-gl-glew-declarations/30307/3
RUN apt-get install -y apt-utils vim && \
    curl -L https://openframeworks.cc/versions/v0.10.1/of_v0.10.1_linux64gcc6_release.tar.gz | tar xz && \
    cd of_v0.10.1_linux64gcc6_release/scripts/linux/ubuntu/ && \
    yes | apt-get install lsb-core && \ 
    yes | ./install_dependencies.sh && yes | ./install_codecs.sh && cd .. && \
    sed -i".bak" -e '212s\#include <GL/glext.h>\//#include <GL/glext.h>\g' ../../libs/openFrameworks/utils/ofConstants.h && \ 
    ./compileOF.sh -j3 && \
    sed -i".bak" -e '21s\sudo cp\cp\g' compilePG.sh && \
    yes | ./compilePG.sh

