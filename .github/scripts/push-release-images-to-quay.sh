#!/bin/bash
set -euxo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_NAME="$1"
VERSION="$2"

case $BRANCH_NAME in

    "master")
       echo "Pushing Release Images for Branch '$BRANCH_NAME'"
       docker push quay.io/riprasad/apicurio-registry-mem:latest-release
       docker push quay.io/riprasad/apicurio-registry-mem:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-asyncmem:latest-release
       docker push quay.io/riprasad/apicurio-registry-asyncmem:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-infinispan:latest-release
       docker push quay.io/riprasad/apicurio-registry-infinispan:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-kafkasql:latest-release
       docker push quay.io/riprasad/apicurio-registry-kafkasql:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-sql:latest-release
       docker push quay.io/riprasad/apicurio-registry-sql:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-streams:latest-release
       docker push quay.io/riprasad/apicurio-registry-streams:${VERSION}
       ;;

    *)
       echo "Pushing Release Images for Branch '$BRANCH_NAME'"
       docker push quay.io/riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
       docker push quay.io/riprasad/apicurio-registry-mem:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
       docker push quay.io/riprasad/apicurio-registry-asyncmem:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
       docker push quay.io/riprasad/apicurio-registry-infinispan:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-release
       docker push quay.io/riprasad/apicurio-registry-kafkasql:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-sql:${BRANCH_NAME}-release
       docker push quay.io/riprasad/apicurio-registry-sql:${VERSION}
       docker push quay.io/riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
       docker push quay.io/riprasad/apicurio-registry-streams:${VERSION}
       ;;
esac
        
