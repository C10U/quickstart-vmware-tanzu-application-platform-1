#!/usr/bin/env bash

set -e
set -u
set -o pipefail

gitSha="$( cd repo && git rev-parse HEAD )"
gitRemote="$( cd repo && git config --get remote.origin.url || echo 'unknown' )"

ytt \
  --file ci-repo/ci/qs-test/taskcat.yml \
  --data-values-env VAR \
  --data-value gitSha="$gitSha" \
  --data-value gitRemote="$gitRemote" \
  > taskcat-config/taskcat.yml
