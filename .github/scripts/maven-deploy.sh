#!/bin/bash
set -euxo pipefail

# Initializing the variable with the Passed Parameter
BRANCH_NAME="$1"

case $BRANCH_NAME in

  "1.2.x" | "1.3.x")
       echo "Deploying Branch '$BRANCH_NAME'"
       echo "Variants Getting Deployed: [mem, asyncmem, infinispan, jpa, kafka, streams]"       
       # Retry 3 times before the steps actually fails
       (echo "===== Maven Deploy Attempt: 1 ====" && mvn deploy --batch-mode -Pprod -Pjpa -Pinfinispan -Pkafka -Pstreams -Pasyncmem -DskipTests -Prelease --settings /home/runner/.m2/settings.xml -DskipTests) || \
       (echo "===== Maven Deploy Attempt: 2 ====" && mvn deploy --batch-mode -Pprod -Pjpa -Pinfinispan -Pkafka -Pstreams -Pasyncmem -DskipTests -Prelease --settings /home/runner/.m2/settings.xml -DskipTests) || \
       (echo "===== Maven Deploy Attempt: 3 ====" && mvn deploy --batch-mode -Pprod -Pjpa -Pinfinispan -Pkafka -Pstreams -Pasyncmem -DskipTests -Prelease --settings /home/runner/.m2/settings.xml -DskipTests) || \
       (echo "==== Maven Deploy Step Failed ====" && exit 1)
       ;; 

  "master" | "2.0.x")
       echo "Deploying Branch '$BRANCH_NAME'"
       echo "Variants Getting Deployed: [mem, asyncmem, infinispan, sql, streams]"
       # Retry 3 times before the steps actually fails
       (echo "===== Maven Deploy Attempt: 1 ====" && mvn deploy --batch-mode -Pprod -Psql -Pinfinispan -Pstreams -Pasyncmem -DskipTests -Prelease --settings /home/runner/.m2/settings.xml -DskipTests) || \
       (echo "===== Maven Deploy Attempt: 2 ====" && mvn deploy --batch-mode -Pprod -Psql -Pinfinispan -Pstreams -Pasyncmem -DskipTests -Prelease --settings /home/runner/.m2/settings.xml -DskipTests) || \
       (echo "===== Maven Deploy Attempt: 3 ====" && mvn deploy --batch-mode -Pprod -Psql -Pinfinispan -Pstreams -Pasyncmem -DskipTests -Prelease --settings /home/runner/.m2/settings.xml -DskipTests) || \
       (echo "==== Maven Deploy Step Failed ====" && exit 1)
       ;;

   *)
       echo "Maven Deploy Failed. Branch '$BRANCH_NAME' not supported."
       exit 1
       ;;
esac