FROM nvidia/cuda:10.0-devel-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER "@hirune924"

# Install useful packages using apt-get
RUN apt-get update && apt-get install -y \
		build-essential \
		make \
		cmake \
		g++ \
		gcc \
		git \
		unzip \
		vim \
		wget \
		curl \
                python3-tk \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*


# Install pip
RUN apt-get update && apt-get install -y python-pip python3-pip \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*


# Install useful Python packages using pip
RUN pip3 --no-cache-dir install --upgrade ipython && \
    pip3 --no-cache-dir install \
                numpy \
                scipy \
                pandas \
                matplotlib \
                scikit-image \
                scikit-learn \
                h5py \
                tqdm \
                absl-py \
                Pillow \
                opencv-python \
                opencv-contrib-python

# Install PyTorch
RUN pip3 install https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl && \
    pip3 install torchvision

# Install TensorFlow
## Current stable release for CPU-only
#RUN pip3 install tensorflow
#
## Preview nightly build for CPU-only (unstable)
#RUN pip3 install tf-nightly
#
## Install TensorFlow 2.0 Alpha
#RUN pip3 install tensorflow==2.0.0-alpha0
#
## Current stable release for GPU
#RUN pip3 install tensorflow-gpu
#
## Preview nightly build for GPU (unstable)
#RUN pip3 install tf-nightly-gpu
#
## Install TensorFlow 2.0 Alpha for GPU
RUN pip3 install tensorflow-gpu==2.0.0-alpha0


# Install keras
RUN pip3 install keras


# Install JupyterLab
RUN pip3 install jupyterlab


# Install Chainer
#RUN apt-get update && apt-get install -y \
#                python-dev \
#                python-pip \
#                python-wheel \
#                python-setuptools \
#                && \
#    pip3 install -U setuptools pip && \
RUN pip3 install cupy-cuda100 chainer 



## Install Albumentations
RUN pip3 install albumentations
