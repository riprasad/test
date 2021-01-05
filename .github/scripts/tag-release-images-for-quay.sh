#!/bin/bash

set -euo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_NAME="$1"
VERSION="$2"


case $BRANCH_NAME in

  "master")
       # if master branch
       docker image tag apicurio/apicurio-registry-mem:latest-release quay.io/riprasad/apicurio-registry-mem:latest-release
       docker image tag apicurio/apicurio-registry-mem:${VERSION} quay.io/riprasad/apicurio-registry-mem:${VERSION}
       docker image tag apicurio/apicurio-registry-sql:latest-release quay.io/riprasad/apicurio-registry-sql:latest-release
       docker image tag apicurio/apicurio-registry-sql:${VERSION} quay.io/riprasad/apicurio-registry-sql:${VERSION}
       docker image tag apicurio/apicurio-registry-infinispan:latest-release quay.io/riprasad/apicurio-registry-infinispan:latest-release
       docker image tag apicurio/apicurio-registry-infinispan:${VERSION} quay.io/riprasad/apicurio-registry-infinispan:${VERSION}
       docker image tag apicurio/apicurio-registry-streams:latest-release quay.io/riprasad/apicurio-registry-streams:latest-release
       docker image tag apicurio/apicurio-registry-streams:${VERSION} quay.io/riprasad/apicurio-registry-streams:${VERSION}
       docker image tag apicurio/apicurio-registry-asyncmem:latest-release quay.io/riprasad/apicurio-registry-asyncmem:latest-release
       docker image tag apicurio/apicurio-registry-asyncmem:${VERSION} quay.io/riprasad/apicurio-registry-asyncmem:${VERSION}
       docker image tag apicurio/apicurio-registry-kafkasql:latest-release quay.io/riprasad/apicurio-registry-kafkasql:latest-release
       docker image tag apicurio/apicurio-registry-kafkasql:${VERSION} quay.io/riprasad/apicurio-registry-kafkasql:${VERSION}
       ;;

   *)
       # any branch other than master
       docker image tag apicurio/apicurio-registry-mem:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-mem:${VERSION} quay.io/riprasad/apicurio-registry-mem:${VERSION}
       docker image tag apicurio/apicurio-registry-sql:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-sql:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-sql:${VERSION} quay.io/riprasad/apicurio-registry-sql:${VERSION}
       docker image tag apicurio/apicurio-registry-infinispan:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-infinispan:${VERSION} quay.io/riprasad/apicurio-registry-infinispan:${VERSION}
       docker image tag apicurio/apicurio-registry-streams:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-streams:${VERSION} quay.io/riprasad/apicurio-registry-streams:${VERSION}
       docker image tag apicurio/apicurio-registry-asyncmem:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-asyncmem:${VERSION} quay.io/riprasad/apicurio-registry-asyncmem:${VERSION}
       docker image tag apicurio/apicurio-registry-kafkasql:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-kafkasql:${VERSION} quay.io/riprasad/apicurio-registry-kafkasql:${VERSION}
       ;;
esac
        