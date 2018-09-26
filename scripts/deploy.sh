#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/env

aws s3 ls s3://${bucket} > /dev/null 2>&1
if [ $? -ne 0 ]
then
    aws s3 mb s3://${bucket}
fi

sam package \
    --region ${region} \
    --template-file $template \
    --s3-bucket ${bucket} \
    --output-template-file ${output}

sam deploy \
    --region ${region} \
    --template-file ${output} \
    --stack-name ${stack} \
    --capabilities CAPABILITY_IAM $@
