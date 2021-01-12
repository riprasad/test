#!/bin/bash
set -euxo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_NAME="$1"
VERSION="$2"

case $BRANCH_NAME in

  "1.2.x" | "1.3.x")
       # if branch "1.2.x" or "1.3.x"
       # variants to tag: mem, asyncmem, infinispan, jpa, kafka, streams
       echo "Tagging Release Images for Branch '$BRANCH_NAME'"
       docker image tag apicurio/apicurio-registry-mem:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-mem:${VERSION} quay.io/riprasad/apicurio-registry-mem:${VERSION}
       docker image tag apicurio/apicurio-registry-asyncmem:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-asyncmem:${VERSION} quay.io/riprasad/apicurio-registry-asyncmem:${VERSION}
       docker image tag apicurio/apicurio-registry-infinispan:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-infinispan:${VERSION} quay.io/riprasad/apicurio-registry-infinispan:${VERSION}
       docker image tag apicurio/apicurio-registry-jpa:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-jpa:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-jpa:${VERSION} quay.io/riprasad/apicurio-registry-jpa:${VERSION}
       docker image tag apicurio/apicurio-registry-kafka:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-kafka:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-kafka:${VERSION} quay.io/riprasad/apicurio-registry-kafka:${VERSION}
       docker image tag apicurio/apicurio-registry-streams:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-streams:${VERSION} quay.io/riprasad/apicurio-registry-streams:${VERSION}
       ;;

   "2.0.x")
       # if branch "2.0.x"
       # variants to tag: mem, asyncmem, infinispan, kafkasql, sql, streams
       echo "Tagging Release Images for Branch '$BRANCH_NAME'"
       docker image tag apicurio/apicurio-registry-mem:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-mem:${VERSION} quay.io/riprasad/apicurio-registry-mem:${VERSION}
       docker image tag apicurio/apicurio-registry-asyncmem:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-asyncmem:${VERSION} quay.io/riprasad/apicurio-registry-asyncmem:${VERSION}
       docker image tag apicurio/apicurio-registry-infinispan:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-infinispan:${VERSION} quay.io/riprasad/apicurio-registry-infinispan:${VERSION}
       docker image tag apicurio/apicurio-registry-kafkasql:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-kafkasql:${VERSION} quay.io/riprasad/apicurio-registry-kafkasql:${VERSION}
       docker image tag apicurio/apicurio-registry-sql:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-sql:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-sql:${VERSION} quay.io/riprasad/apicurio-registry-sql:${VERSION}
       docker image tag apicurio/apicurio-registry-streams:${BRANCH_NAME}-release quay.io/riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
       docker image tag apicurio/apicurio-registry-streams:${VERSION} quay.io/riprasad/apicurio-registry-streams:${VERSION}
       ;;

  "master")
       # if master branch
       # variants to tag: mem, asyncmem, infinispan, kafkasql, sql, streams
       echo "Tagging Release Images for Branch '$BRANCH_NAME'"
       docker image tag apicurio/apicurio-registry-mem:latest-release quay.io/riprasad/apicurio-registry-mem:latest-release
       docker image tag apicurio/apicurio-registry-mem:${VERSION} quay.io/riprasad/apicurio-registry-mem:${VERSION}
       docker image tag apicurio/apicurio-registry-asyncmem:latest-release quay.io/riprasad/apicurio-registry-asyncmem:latest-release
       docker image tag apicurio/apicurio-registry-asyncmem:${VERSION} quay.io/riprasad/apicurio-registry-asyncmem:${VERSION}
       docker image tag apicurio/apicurio-registry-infinispan:latest-release quay.io/riprasad/apicurio-registry-infinispan:latest-release
       docker image tag apicurio/apicurio-registry-infinispan:${VERSION} quay.io/riprasad/apicurio-registry-infinispan:${VERSION}
       docker image tag apicurio/apicurio-registry-kafkasql:latest-release quay.io/riprasad/apicurio-registry-kafkasql:latest-release
       docker image tag apicurio/apicurio-registry-kafkasql:${VERSION} quay.io/riprasad/apicurio-registry-kafkasql:${VERSION}
       docker image tag apicurio/apicurio-registry-sql:latest-release quay.io/riprasad/apicurio-registry-sql:latest-release
       docker image tag apicurio/apicurio-registry-sql:${VERSION} quay.io/riprasad/apicurio-registry-sql:${VERSION}
       docker image tag apicurio/apicurio-registry-streams:latest-release quay.io/riprasad/apicurio-registry-streams:latest-release
       docker image tag apicurio/apicurio-registry-streams:${VERSION} quay.io/riprasad/apicurio-registry-streams:${VERSION}
       ;;

  *)
       # any other branch
       echo "No Image available to tag for Branch '${BRANCH_NAME}'"
       exit 1
       ;;

esac
        