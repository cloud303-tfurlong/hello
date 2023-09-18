#!/bin/bash

set -euxo pipefail

[ -d work ] && rm -rf work
[ -d .nextflow ] && rm -rf .nextflow
rm .nextflow.log*
