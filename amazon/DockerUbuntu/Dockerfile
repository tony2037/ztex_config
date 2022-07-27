FROM ubuntu:20.04

# Set timezone
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# These variables are set in the build-my-ubuntu script
ARG MY_USER
ARG MY_UID
ARG MY_GID
ARG MY_SHELL
ARG ssh_prv_key
ARG ssh_pub_key
ARG ssh_config

# Update base image, install sudo, and create sudo user on image from current user
RUN apt-get update
RUN apt-get install -y sudo

# Install build package
RUN dpkg --add-architecture i386 \
    && apt update && apt install -y build-essential \
    && apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 \
    && apt install -y liblz4-tool gawk lcov \
    && apt install -y gettext bc rsync xxd curl \
    && apt install -y squashfs-tools cpio mtd-utils \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y tzdata \
    && apt install -y libssl-dev \
    && apt install -y vim

# Build tools
RUN  apt install -y libtool bison flex \
    && apt install -y cmake doxygen git \
    && apt install -y pkg-config \
    && apt install -y automake-1.15 \
    && apt install -y autopoint \
    && apt install -y default-jre
     
# Python 3 and related
RUN apt install -y python \
    && apt install -y python3 \
    && apt install -y python3-pip \
    && apt install -y python-crypto \
    && apt install -y python-protobuf \
    && apt install -y libkrb5-dev \
    && apt install -y python3-dev \
    && apt install -y krb5-multidev \
    && pip3 install markdown \
    && pip3 install pdfkit \
    && pip3 install pybars3 \
    && pip3 install pyyaml \
    && pip3 install requests-kerberos \
    && pip3 install "protobuf>=3.7.1" \
    && pip3 install --force-reinstall networkx==2.5

# Development tools
RUN apt install -y silversearcher-ag \
    && apt install -y tig

# Add the keys and set permissions
#RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
#    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
#    echo "$ssh_config" > /root/.ssh/config && \
#    chmod 600 /root/.ssh/id_rsa && \
#    chmod 600 /root/.ssh/id_rsa.pub \
#    chmod 600 /root/.ssh/config

RUN useradd --uid ${MY_UID} --gid ${MY_GID} --groups sudo -m --shell ${MY_SHELL} ${MY_USER}
RUN echo "${MY_USER}     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# You can use the setup.sh script to install packages and otherwise configure your container
# image to suit your development work. The script is copied and run during the build process.
COPY setup.sh /root/setup.sh
RUN /root/setup.sh

# Set user for image and set home directory as working directory.
USER ${MY_USER}
WORKDIR /home/${MY_USER}

# SSH
RUN mkdir -p /home/${MY_USER}/.ssh

# Git
run touch /home/${MY_USER}/.gitconfig
