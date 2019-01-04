# Dockerfile to create a Docker image with an Oracle jdk
# It requires the Oracle jdk tgz available to Docker *in the current directory*
# For example, to create an Oracle JDK 11.0.1 Docker image:
#     docker build -t oracle-jdk-11.0.1 --build-arg jdk_tarball=jdk-11.0.1_linux-x64_bin.tar.gz -f oracle-jdk.dockerfile .
#
# Based on https://github.com/docker-library/openjdk/blob/c3023e4da10d10e9c9775eabe2d7baac146e7ae1/11/jdk/Dockerfile
FROM buildpack-deps:stretch-scm

RUN apt-get update && apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils \
	&& rm -rf /var/lib/apt/lists/*

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/stretch-backports.list

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

RUN wget -O /tmp/301-install-java.bash https://raw.githubusercontent.com/jcaraballo/vagrant-ubuntu-18.10-dev/master/boot/301-install-java.bash
RUN chmod 755 /tmp/301-install-java.bash

ARG jdk_tarball
ENV jdk_tarball $jdk_tarball
RUN test -n "$jdk_tarball"
COPY $jdk_tarball /tmp/jdk.tgz
RUN /tmp/301-install-java.bash /tmp/jdk.tgz
