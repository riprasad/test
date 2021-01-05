#!/bin/bash

set -euo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_REF="$1"

# Removing string "refs/heads" from variable ${BRANCH_REF} using Parameter Substitution
BRANCH_NAME=${BRANCH_REF#refs/heads/}


case $BRANCH_NAME in

    "refs/heads/master")
       # if master branch
       docker push riprasad/apicurio-registry-mem:latest-snapshot
       docker push riprasad/apicurio-registry-sql:latest-snapshot
       docker push riprasad/apicurio-registry-infinispan:latest-snapshot
       docker push riprasad/apicurio-registry-streams:latest-snapshot
       docker push riprasad/apicurio-registry-asyncmem:latest-snapshot
       docker push riprasad/apicurio-registry-kafkasql:latest-snapshot
       ;;

    *)
       # any branch other than master
       docker push riprasad/apicurio-registry-mem:${BRANCH_NAME}-snapshot
       docker push riprasad/apicurio-registry-sql:${BRANCH_NAME}-snapshot
       docker push riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-snapshot
       docker push riprasad/apicurio-registry-streams:${BRANCH_NAME}-snapshot
       docker push riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-snapshot
       docker push riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-snapshot
       ;;
esac
        