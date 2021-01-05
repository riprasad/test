#!/bin/bash

set -euo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_REF="$1"

# Removing string "refs/heads" from variable ${BRANCH_REF} using Parameter Substitution
BRANCH_NAME=${BRANCH_REF#refs/heads/}


case $BRANCH_REF in

  "refs/heads/master")
       # if master branch
       docker image tag apicurio/apicurio-registry-mem:latest-snapshot quay.io/riprasad/apicurio-registry-mem:latest-snapshot
       docker image tag apicurio/apicurio-registry-sql:latest-snapshot quay.io/riprasad/apicurio-registry-sql:latest-snapshot
       docker image tag apicurio/apicurio-registry-infinispan:latest-snapshot quay.io/riprasad/apicurio-registry-infinispan:latest-snapshot
       docker image tag apicurio/apicurio-registry-streams:latest-snapshot quay.io/riprasad/apicurio-registry-streams:latest-snapshot
       docker image tag apicurio/apicurio-registry-asyncmem:latest-snapshot quay.io/riprasad/apicurio-registry-asyncmem:latest-snapshot
       docker image tag apicurio/apicurio-registry-kafkasql:latest-snapshot quay.io/riprasad/apicurio-registry-kafkasql:latest-snapshot
       ;;

   *)
       # any branch other than master
       docker image tag apicurio/apicurio-registry-mem:${BRANCH_NAME}-snapshot quay.io/riprasad/apicurio-registry-mem:${BRANCH_NAME}-snapshot
       docker image tag apicurio/apicurio-registry-sql:${BRANCH_NAME}-snapshot quay.io/riprasad/apicurio-registry-sql:${BRANCH_NAME}-snapshot
       docker image tag apicurio/apicurio-registry-infinispan:${BRANCH_NAME}-snapshot quay.io/riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-snapshot
       docker image tag apicurio/apicurio-registry-streams:${BRANCH_NAME}-snapshot quay.io/riprasad/apicurio-registry-streams:${BRANCH_NAME}-snapshot
       docker image tag apicurio/apicurio-registry-asyncmem:${BRANCH_NAME}-snapshot quay.io/riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-snapshot
       docker image tag apicurio/apicurio-registry-kafkasql:${BRANCH_NAME}-snapshot quay.io/riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-snapshot
       ;;
esac
        