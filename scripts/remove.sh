#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/env

aws cloudformation delete-stack --stack-name $stack
