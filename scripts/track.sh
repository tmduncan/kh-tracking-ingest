#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/env

url=$(aws cloudformation describe-stacks --region ${region} --stack-name $stack --query Stacks[0].Outputs[0].OutputValue --output text)
record='{"name": "John", "action": "charge", "value": 100}'

curl \
    -H "Content-Type: application/json" \
    -X POST \
    -d "$record" \
    $url
