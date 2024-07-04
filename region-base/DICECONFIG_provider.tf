variable "region" {}
variable "aws_profile" {}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

# #########
# terraform
# #########

# rest of the backend part will be filled by terragrunt
terraform {
  backend "s3" {}
}
