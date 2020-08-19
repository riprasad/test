#!/bin/bash

set -euo pipefail

IMAGES=("$@")
SHA=()
i=0

# Fetching SHA Digest for the images
for image in "${IMAGES[@]}"; do
  SHA[$i]=$(skopeo inspect --raw --tls-verify=false docker://${image} | jq --raw-output '.config.digest' | sed 's/sha256://;s/"//g')
  echo "SHA for Image ${image}: ${SHA[$i]}"
  ((i=i+1))
done
echo "The Images are successfully pushed to the dockerhub. Verifying if the images are same..."


# Verifying if images are same by comparing SHA Digest of the images
watermark=${SHA[0]}
not_equal=false
for i in "${SHA[@]}"; do
    if [[ "$watermark" != "$i" ]]; then
        not_equal=true
        break
    fi
done

if [[ $not_equal = "true" ]]; then
	echo "[FAILURE] The Images Are Not Same. Verification Failed" && exit 1
else
	echo "[SUCCESS] Verification Successfull! The SHA Digest Matched for all the images."
fi




