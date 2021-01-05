#!/bin/bash

set -euo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_NAME="$1"
VERSION="$2"


case $BRANCH_NAME in

  "master")
       # if master branch
       docker image tag apicurio/apicurio-registry-mem:latest-release riprasad/apicurio-registry-mem:latest-release
       docker image tag apicurio/apicurio-registry-mem:${VERSION} riprasad/apicurio-registry-mem:${VERSION}
       docker image tag apicurio/apicurio-registry-sql:latest-release riprasad/apicurio-registry-sql:latest-release
       docker image tag apicurio/apicurio-registry-sql:${VERSION} riprasad/apicurio-registry-sql:${VERSION}
       docker image tag apicurio/apicurio-registry-infinispan:latest-release riprasad/apicurio-registry-infinispan:latest-release
       docker image tag apicurio/apicurio-registry-infinispan:${VERSION} riprasad/apicurio-registry-infinispan:${VERSION}
       docker image tag apicurio/apicurio-registry-streams:latest-release riprasad/apicurio-registry-streams:latest-release
       docker image tag apicurio/apicurio-registry-streams:${VERSION} riprasad/apicurio-registry-streams:${VERSION}
       docker image tag apicurio/apicurio-registry-asyncmem:latest-release riprasad/apicurio-registry-asyncmem:latest-release
       docker image tag apicurio/apicurio-registry-asyncmem:${VERSION} riprasad/apicurio-registry-asyncmem:${VERSION}
       docker image tag apicurio/apicurio-registry-kafkasql:latest-release riprasad/apicurio-registry-kafkasql:latest-release
       docker image tag apicurio/apicurio-registry-kafkasql:${VERSION} riprasad/apicurio-registry-kafkasql:${VERSION}
       ;;

   *)
       # any branch other than master
       docker image tag apicurio/apicurio-registry-mem:${BRANCH_NAME}-release riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-mem:${VERSION} riprasad/apicurio-registry-mem:${VERSION}
       docker image tag apicurio/apicurio-registry-sql:${BRANCH_NAME}-release riprasad/apicurio-registry-sql:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-sql:${VERSION} riprasad/apicurio-registry-sql:${VERSION}
       docker image tag apicurio/apicurio-registry-infinispan:${BRANCH_NAME}-release riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-infinispan:${VERSION} riprasad/apicurio-registry-infinispan:${VERSION}
       docker image tag apicurio/apicurio-registry-streams:${BRANCH_NAME}-release riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-streams:${VERSION} riprasad/apicurio-registry-streams:${VERSION}
       docker image tag apicurio/apicurio-registry-asyncmem:${BRANCH_NAME}-release riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-asyncmem:${VERSION} riprasad/apicurio-registry-asyncmem:${VERSION}
       docker image tag apicurio/apicurio-registry-kafkasql:${BRANCH_NAME}-release riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-kafkasql:${VERSION} riprasad/apicurio-registry-kafkasql:${VERSION}
       ;;
esac
        