# Copied from https://github.com/kmontg/xv6-docker/blob/master/Dockerfile
# Modified to work with x86 Mac
FROM ubuntu:20.04

RUN apt-get -qq update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y \
                    build-essential \
                    gdb \
                    # the following library is for x86 mac
                    gcc-x86-64-linux-gnu \
                    #gcc-multilib-x86-64-linux-gnu \
                    tmux \
                    qemu-system-x86 \
                    gawk \
                    expect

ADD . /xv6-public

WORKDIR /xv6-public

ENV TOOLPREFIX=x86_64-linux-gnu-

CMD ["/bin/bash"]
