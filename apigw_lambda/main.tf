###### AWS Provider ######
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

###### s3 State / Optional  #####
/*
terraform {
  backend "s3" {
    profile = ""
    region  = ""
    bucket = ""
    key = ""
  }
}
*/
