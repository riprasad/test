#!/bin/bash
set -euxo pipefail

# Initializing the variable with the Passed Parameter
BRANCH_NAME="$1"

# change directory to docker pom
cd distro/docker


case $BRANCH_NAME in

  "1.2.x" | "1.3.x")
       # if branch 1.2.x (or) 1.3.x, tag images in the form "${BRANCH_NAME}-release"
       # variants to build: mem, asyncmem, infinispan, jpa, kafka, streams
       echo "Building Release Images for Branch '$BRANCH_NAME'"
       mvn package -Pprod -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pasyncmem -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pinfinispan -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pjpa -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pkafka -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pstreams -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       ;;

   "2.0.x")
       # if branch "2.0.x", tag image with "2.0.x-release"
       # variants to build: mem, asyncmem, infinispan, kafkasql, sql, streams
       echo "Building Release Images for Branch '$BRANCH_NAME'"
       mvn package -Pprod -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pasyncmem -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pinfinispan -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pkafkasql -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Psql -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       mvn package -Pprod -Pstreams -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-release
       ;; 

  "master")
       # if master branch, tag image with "latest-release"
       # variants to build: mem, asyncmem, infinispan, kafkasql, sql, streams
       echo "Building Release Images for Branch '$BRANCH_NAME'"
       mvn package -Pprod -DskipTests -Ddocker -Ddocker.tag.name=latest-release
       mvn package -Pprod -Pasyncmem -DskipTests -Ddocker -Ddocker.tag.name=latest-release
       mvn package -Pprod -Pinfinispan -DskipTests -Ddocker -Ddocker.tag.name=latest-release
       mvn package -Pprod -Pkafkasql -DskipTests -Ddocker -Ddocker.tag.name=latest-release
       mvn package -Pprod -Psql -DskipTests -Ddocker -Ddocker.tag.name=latest-release
       mvn package -Pprod -Pstreams -DskipTests -Ddocker -Ddocker.tag.name=latest-release
       ;;

    *)
       echo "Cannot Build Image for Branch '${BRANCH_NAME}'"
       exit 1
       ;;
esac
        