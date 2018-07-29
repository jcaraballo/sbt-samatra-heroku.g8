FROM openjdk:8u171-jdk
RUN wget https://piccolo.link/sbt-1.1.6.tgz --quiet -O - | tar xz -C /opt
ENV PATH="/opt/sbt/bin:${PATH}"

# Retreive Scala and SBT dependencies
WORKDIR /retrieving
COPY project/build.properties project/build.properties
RUN sbt about

# Installing g8
WORKDIR /root
RUN pwd
# Installing conscript
RUN echo 'export CONSCRIPT_HOME="$HOME/.conscript"' >> .bashrc \
    && echo 'export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"' >> .bashrc \
    && echo 'export PATH=$CONSCRIPT_HOME/bin:$PATH' >> .bashrc
# Installing conscript: Executing conscript's setup.sh to install to ~/.conscript/bin/cs
RUN wget https://raw.githubusercontent.com/foundweekends/conscript/master/setup.sh --quiet -O - | sh
# Instaling g8 with Conscript
RUN /bin/bash -c "cd /root && .conscript/bin/cs foundweekends/giter8"

COPY . /app/template
WORKDIR /app

RUN /bin/bash -c "source ~/.bashrc && g8 file://template --name=potato"


WORKDIR /app/potato

RUN sbt test


