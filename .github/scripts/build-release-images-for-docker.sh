#!/bin/bash

set -euo pipefail

# Initializing the variable with the Passed Parameter
BRANCH_NAME="$1"

# change directory to docker pom
cd registry/distro/docker


case $BRANCH_NAME in

  "master")
       # if master branch, tag image with "latest-release"
       mvn package -Pprod -DskipTests -Ddocker
       mvn package -Pprod -Psql -DskipTests -Ddocker
       mvn package -Pprod -Pinfinispan -DskipTests -Ddocker
       mvn package -Pprod -Pstreams -DskipTests -Ddocker
       mvn package -Pprod -Pasyncmem -DskipTests -Ddocker
       mvn package -Pprod -Pkafkasql -DskipTests -Ddocker

       # The above maven commands will build docker image with pom-version tag (e.g. 1.3.2.Final)
       # Then it wll create two tags i.e. "latest" and "latest-release"
       # if you do not specify "-Ddocker.tag.name", by default it will tag the image as "latest-release"
       ;;

   *)
       # any branch other than master, tag image in the form "${BRANCH_NAME}-release"
       mvn package -Pprod -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Psql -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pinfinispan -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pstreams -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pasyncmem -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pkafkasql -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release

       # The above maven commands will build docker image with pom-version tag (e.g. 1.3.2.Final)
       # Then it wll create two tags i.e. "latest" and "${BRANCH_NAME}-release"       
       ;;
esac
        