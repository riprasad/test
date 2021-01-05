#!/bin/bash

set -euo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_REF="$1"

# Removing string "refs/heads" from variable ${BRANCH_REF} using Parameter Substitution
BRANCH_NAME=${BRANCH_REF#refs/heads/}

# change directory to docker pom
cd registry/distro/docker


case $BRANCH_REF in

  "refs/heads/master")
       # if master branch, tag image with "latest-snapshot"
       mvn package -Pprod -DskipTests -Ddocker -Ddocker.tag.name=latest-snapshot
       mvn package -Pprod -Psql -DskipTests -Ddocker -Ddocker.tag.name=latest-snapshot
       mvn package -Pprod -Pinfinispan -DskipTests -Ddocker -Ddocker.tag.name=latest-snapshot
       mvn package -Pprod -Pstreams -DskipTests -Ddocker -Ddocker.tag.name=latest-snapshot
       mvn package -Pprod -Pasyncmem -DskipTests -Ddocker -Ddocker.tag.name=latest-snapshot
       mvn package -Pprod -Pkafkasql -DskipTests -Ddocker -Ddocker.tag.name=latest-snapshot
       ;;

   *)
       # any branch other than master, tag image in the form "${BRANCH_NAME}-snapshot"
       mvn package -Pprod -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-snapshot
       mvn package -Pprod -Psql -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-snapshot
       mvn package -Pprod -Pinfinispan -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-snapshot
       mvn package -Pprod -Pstreams -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-snapshot
       mvn package -Pprod -Pasyncmem -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-snapshot
       mvn package -Pprod -Pkafkasql -DskipTests -Ddocker -Ddocker.tag.name=${BRANCH_NAME}-snapshot
       ;;
esac
        