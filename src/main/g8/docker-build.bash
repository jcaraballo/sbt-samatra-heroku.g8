#!/bin/bash

tmpdir=$( mktemp -d )

docker build --iidfile=${tmpdir}/iidfile -f - . <<EOF
FROM openjdk:8u171-jdk
RUN wget https://piccolo.link/sbt-1.2.8.tgz --quiet -O - | tar xz -C /opt

RUN useradd --uid $UID --create-home --home-dir /home/${USER} $USER

USER $USER

ENV PATH="/opt/sbt/bin:${PATH}"
EOF
image_id=$( cat ${tmpdir}/iidfile )

echo Built docker image for buinding in sbt with id $image_id

mkdir -p ~/.ivy2 && docker run -v ~/.ivy2:/home/${USER}/.ivy2 -v ${PWD}:/home/${USER}/build $image_id /bin/sh -c "cd /home/${USER}/build && sbt test"

