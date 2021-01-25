#!/bin/bash
set -euxo pipefail

RELEASE_VERSION="$1"
SNAPSHOT_VERSION="$2"
BRANCH="master"
OWNER="riprasad"
REPOSITORY="riprasad/test"
ACCESS_TOKEN="ca92a92f0f548541284815c1b874c15a02afc0cd"


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

generate_post_data() {
	cat <<EOF
	{
	  "tag_name": "$RELEASE_VERSION",
	  "target_commitish": "$BRANCH",
	  "name": "$RELEASE_VERSION",
	  "body": "",
	  "draft": false,
	  "prerelease": false
	}
	EOF
}

echo "Creating release '$RELEASE_VERSION' for Repo '$REPOSITORY' and Branch: '$BRANCH'"
curl --data "$(generate_post_data)" "https://api.github.com/repos/$REPOSITORY/releases?access_token=$ACCESS_TOKEN"
echo "Release Successful."









