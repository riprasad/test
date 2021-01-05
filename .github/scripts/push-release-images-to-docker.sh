#!/bin/bash

set -euo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_NAME="$1"
VERSION="$2"


case $BRANCH_NAME in

    "master")
       # if master branch
       docker push riprasad/apicurio-registry-mem:latest-release
       docker push riprasad/apicurio-registry-mem:${VERSION}
       docker push riprasad/apicurio-registry-sql:latest-release
       docker push riprasad/apicurio-registry-sql:${VERSION}
       docker push riprasad/apicurio-registry-infinispan:latest-release
       docker push riprasad/apicurio-registry-infinispan:${VERSION}
       docker push riprasad/apicurio-registry-streams:latest-release
       docker push riprasad/apicurio-registry-streams:${VERSION}
       docker push riprasad/apicurio-registry-asyncmem:latest-release
       docker push riprasad/apicurio-registry-asyncmem:${VERSION}
       docker push riprasad/apicurio-registry-kafkasql:latest-release
       docker push riprasad/apicurio-registry-kafkasql:${VERSION}
       ;;

    *)
       # any branch other than master
       docker push riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-mem:${VERSION}
       docker push riprasad/apicurio-registry-sql:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-sql:${VERSION}
       docker push riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-infinispan:${VERSION}
       docker push riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-streams:${VERSION}
       docker push riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-asyncmem:${VERSION}
       docker push riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-kafkasql:${VERSION}
       ;;
esac
        