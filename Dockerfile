FROM openjdk:8u171-jdk
RUN wget https://piccolo.link/sbt-1.2.1.tgz --quiet -O - | tar xz -C /opt
ENV PATH="/opt/sbt/bin:${PATH}"

# Retreive Scala and SBT dependencies
WORKDIR /retrieving
COPY project/build.properties project/build.properties
RUN sbt about

# Use template to build the potato project
COPY . /app/template.g8
WORKDIR /app
RUN sbt new file://template.g8 --name=potato

# Run the tests in the newly created potato project
WORKDIR /app/potato
RUN sbt test

