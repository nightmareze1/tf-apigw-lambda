#!/bin/bash

AWS_PROFILE=$1
AWS_REGION=$2
FUNCTION_NAME=$3

docker build -f Dockerfile . -t app_code

BUILD_NUMBER=$(date +"%s") && docker run --name app_code-$BUILD_NUMBER app_code bash -c "ls -la"

docker cp app_code-$BUILD_NUMBER:/src/lambda.zip ./lambda_code_build.zip

aws lambda update-function-code --profile $AWS_PROFILE --region $AWS_REGION --function-name $FUNCTION_NAME --zip-file fileb://lambda_code_build.zip --publish 
