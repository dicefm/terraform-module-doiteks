variable "region" {}
variable "aws_profile" {}

provider "aws" {
  region  = var.region
}

data "aws_eks_cluster" "this" {
  name = var.cluster.name
}
data "aws_eks_cluster_auth" "this" {
  name = var.cluster.name
}

provider "kubernetes" {
  host                    = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate  = var.kubeconfig-certificate-authority-data
  token                   = data.aws_eks_cluster_auth.this.token
}

# #########
# terraform
# #########

# rest of the backend part will be filled by terragrunt
terraform {
  backend "s3" {}
}
