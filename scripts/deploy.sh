#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/env

sam package \
    --template-file $template \
    --s3-bucket $bucket \
    --output-template-file $output

sam deploy \
    --template-file $output \
    --stack-name $stack \
    --capabilities CAPABILITY_IAM $@
