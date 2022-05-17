# AWS_VPC

## Requirements
- terraform 0.13.6

## How to Install terraform?
- In my case, I use tfswitch is very helpfull for switch/install terraform versions

https://tfswitch.warrensbox.com/Install/

```
tfswitch 0.13.6
```

### Network Requirements
- 1 VPC - 4096 IPS
- 4 Subnets - 256 IPS

- 2 private ( private resources - nat-gw )
- 2 publics ( public resources - igw )

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
