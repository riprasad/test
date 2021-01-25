#!/bin/bash
set -euxo pipefail

RELEASE_VERSION="$1"
SNAPSHOT_VERSION="$2"
BRANCH="master"
OWNER="riprasad"
REPOSITORY="riprasad/test"
ACCESS_TOKEN="d58a742555715a2a776f27b2ed593e7efbcfe8ca"


echo "Releasing version ${RELEASE_VERSION} from branch ${BRANCH}"
echo "Next Snapshot version will be ${SNAPSHOT_VERSION}"

echo "Code Checkout..."

git init
git config --global user.name "github-actions"
git config --global user.email "github-actions@github.com"
git remote add origin "https://${OWNER}:${ACCESS_TOKEN}@github.com/${REPOSITORY}.git"
git fetch
git checkout ${BRANCH}
git branch --set-upstream-to=origin/${BRANCH}
git pull

echo "Update Release Version"
mvn versions:set -DnewVersion=${RELEASE_VERSION} -DgenerateBackupPoms=false -DprocessAllModules=true

echo "Commit Release Version"
git add .
git commit -m "Automated version update: ${RELEASE_VERSION}"
git push

echo "CREATING RELEASE..."

curl --data '{"tag_name": "v$RELEASE_VERSION",
                "target_commitish": "$BRANCH",
                "name": "v$RELEASE_VERSION",
                "body": "Release of version $RELEASE_VERSION",
                "draft": false,
                "prerelease": false}' \
    https://api.github.com/repos/$OWNER/$REPOSITORY/releases?access_token=$ACCESS_TOKEN









