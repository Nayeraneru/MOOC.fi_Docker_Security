#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-image>"
  exit 1
fi

# Stop immediately if any command fails
set -e

GITHUB_REPO=$1
DOCKER_REPO=$2

# Make a temporary folder and delete it when the script ends
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Cloning $GITHUB_REPO ..."
git clone "https://github.com/$GITHUB_REPO.git" "$TMP_DIR"

cd "$TMP_DIR"

echo "Building $DOCKER_REPO ..."
docker build -t "$DOCKER_REPO" .

echo "Pushing $DOCKER_REPO ..."
docker push "$DOCKER_REPO"
