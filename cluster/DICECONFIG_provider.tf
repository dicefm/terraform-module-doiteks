variable "region" {}
variable "aws_profile" {}

provider "aws" {
  region  = var.region
}

variable "clustername" {}

data "aws_eks_cluster" "this" {
  name = var.clustername
}
data "aws_eks_cluster_auth" "this" {
  name = var.clustername
}

provider "kubernetes" {
  host                    = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate  = data.aws_eks_cluster.this.certificate_authority[0].data
  token                   = data.aws_eks_cluster_auth.this.token
}

# #########
# terraform
# #########

# rest of the backend part will be filled by terragrunt
terraform {
  backend "s3" {}
}
