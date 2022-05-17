# Lambda | Api GW | SG | IAM_ROLE

### Edit terraform.tfvars (You need configure AWS_REGION,AWS_PROFILE,VPC_ID and Subnets_ID previously deployed)

```
aws_region = "us-east-1"
aws_profile = "zz"
network_vpc_id = "vpc-0a2d2408224f0b3ec"
network_subnets_ids = ["subnet-0f50d5ef4412e03b8", "subnet-060ffdb5c13ec70fe"]
```

### Ready to running terraform
```
terraform init
terraform plan
terraform apply
```


### How to test | OPTION1
```
./app_test.sh
```

### How to test | OPTION2
```
terraform refresh
curl -XGET $(terraform output url)/$(terraform output path)
```
