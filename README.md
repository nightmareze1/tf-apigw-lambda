## Contains
- AWS_VPC(folder aws_vpc)
- API_GW/LAMBDA/s3 (folder apigw_lambda)
- LAMBDA CODE (folder app_code)

## Requirements
- terraform 0.13.6 

## How to Install terraform?
- In my case, I use tfswitch is very helpfull for switch/install terraform versions

https://tfswitch.warrensbox.com/Install/

```
tfswitch 0.13.6
```

# AWS_VPC

### Network Requirements
- 1 VPC - 4096 IPS
- 4 Subnets - 256 IPS

- 2 private ( private resources - nat-gw )
- 2 publics ( public resources - igw )

```
cd aws_vpc
```

### Configure your AWS_PROFILE (variable aws_profile=example)

```
vi terraform.tfvars
```

```
terraform init
terraform plan
terraform apply
```

### Obtain vpc_id and subnets
```
./network_info.sh
```

### Output example:
```
Network Info! update this variables in ../apigw_lambda/terraform.tfvars

network_vpc_id = "vpc-0a2d2408224f0b3ec"
network_subnets_ids=["subnet-0f50d5ef4412e03b8","subnet-060ffdb5c13ec70fe"]
```

# Lambda | Api GW | SG | IAM_ROLE
```
cd apigw_lambda
```

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

# APP_CODE and Build / Deploy
```
cd app_code
```

## Requirements
- Docker

## Deploy Example(./build.sh aws_profile aws_region lambda_function_name)
```
./build.sh zz us-east-1 app-code-lambda
```
