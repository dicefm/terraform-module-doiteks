variable "region" {}
variable "aws_profile" {}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

variable "clustername" {}

data "aws_eks_cluster" "this" {
  name = var.clustername
}

provider "kubernetes" {
  alias                  = var.clustername
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.this.token
}

# #########
# terraform
# #########

# rest of the backend part will be filled by terragrunt
terraform {
  backend "s3" {}
}
