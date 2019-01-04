# $name$

## Run the tests

1. Directly:
   ```
   sbt test
   ```
2. With Docker on open JDK:
   ```
   ./docker-build.bash
   ```
3. With Docker on Oracle JDK:
   Create a docker image with Oracle JDK using `oracle-jdk.dockerfile` and run `docker-build.bash` 
   specifying the image. E.g.:
   ```
   docker build -t oracle-jdk-8u181 --build-arg jdk_tarball=jdk-8u181-linux-x64.tar.gz -f oracle-jdk.dockerfile .
   ./docker-build.bash oracle-jdk-8u181
   ```
