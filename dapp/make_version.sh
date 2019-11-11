#!/bin/bash
COMMIT=$(echo -n `git log -1 --oneline | cut -c1-7`)
DATE=$(echo -n `date +%Y-%b-%d`)
BRANCH=$(echo -n `git branch | grep \* | cut -d ' ' -f2`)
IMAGE_TAG="${BRANCH}-${COMMIT}-${DATE}"
echo $IMAGE_TAG
