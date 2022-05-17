#!/bin/bash

terraform init

terraform refresh

echo ""

echo "Testing api_gateway and lambda:"

curl -XGET $(terraform output url)/$(terraform output path)

echo ""

echo "Curl command:"

echo "curl -XGET $(terraform output url)/$(terraform output path)"
