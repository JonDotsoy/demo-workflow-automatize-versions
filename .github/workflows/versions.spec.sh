#!/bin/sh

set -e

__filename=`realpath $0`
__dirname=`dirname $__filename`
workflow_file=`realpath "$__dirname/versions.yml"`

export CONF_BASE_PATHS=k8s
export DRY_RUN=true

cat $workflow_file | yq -o json | jq '.jobs.hi.steps[2].run' -r | sh
