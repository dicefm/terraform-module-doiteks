variable "region" {}

provider "aws" {
  region  = var.region
}

# #########
# terraform
# #########

# rest of the backend part will be filled by terragrunt
terraform {
  backend "s3" {}
}
