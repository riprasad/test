#!/bin/bash
set -euxo pipefail

# Initializing the variable with the Passed Parameters
BRANCH_NAME="$1"
VERSION="$2"

case $BRANCH_NAME in

   "1.2.x" | "1.3.x")
      # if branch "1.2.x" or "1.3.x"
      # variants to push: mem, asyncmem, infinispan, jpa, kafka, streams
      echo "Pushing Release Images for Branch '$BRANCH_NAME'"
      docker push riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
      docker push riprasad/apicurio-registry-mem:${VERSION}
      docker push riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
      docker push riprasad/apicurio-registry-asyncmem:${VERSION}
      docker push riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
      docker push riprasad/apicurio-registry-infinispan:${VERSION}
      docker push riprasad/apicurio-registry-jpa:${BRANCH_NAME}-release
      docker push riprasad/apicurio-registry-jpa:${VERSION}
      docker push riprasad/apicurio-registry-kafka:${BRANCH_NAME}-release
      docker push riprasad/apicurio-registry-kafka:${VERSION}
      docker push riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
      docker push riprasad/apicurio-registry-streams:${VERSION}
      ;;

    "2.0.x")
       # if branch "2.0.x"
       # variants to push: mem, asyncmem, infinispan, kafkasql, sql, streams
       echo "Pushing Release Images for Branch '$BRANCH_NAME'"
       docker push riprasad/apicurio-registry-mem:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-mem:${VERSION}
       docker push riprasad/apicurio-registry-asyncmem:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-asyncmem:${VERSION}
       docker push riprasad/apicurio-registry-infinispan:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-infinispan:${VERSION}
       docker push riprasad/apicurio-registry-kafkasql:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-kafkasql:${VERSION}
       docker push riprasad/apicurio-registry-sql:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-sql:${VERSION}
       docker push riprasad/apicurio-registry-streams:${BRANCH_NAME}-release
       docker push riprasad/apicurio-registry-streams:${VERSION}
       ;;

    "master")
       # if master branch
       # variants to push: mem, asyncmem, infinispan, kafkasql, sql, streams
       echo "Pushing Release Images for Branch '$BRANCH_NAME'"
       docker push riprasad/apicurio-registry-mem:latest-release
       docker push riprasad/apicurio-registry-mem:${VERSION}
       docker push riprasad/apicurio-registry-asyncmem:latest-release
       docker push riprasad/apicurio-registry-asyncmem:${VERSION}
       docker push riprasad/apicurio-registry-infinispan:latest-release
       docker push riprasad/apicurio-registry-infinispan:${VERSION}
       docker push riprasad/apicurio-registry-kafkasql:latest-release
       docker push riprasad/apicurio-registry-kafkasql:${VERSION}
       docker push riprasad/apicurio-registry-sql:latest-release
       docker push riprasad/apicurio-registry-sql:${VERSION}
       docker push riprasad/apicurio-registry-streams:latest-release
       docker push riprasad/apicurio-registry-streams:${VERSION}
       ;;

    *)
       # any other branch
       echo "No Image available to push for Branch '${BRANCH_NAME}'"
       exit 1
       ;;
esac
        
