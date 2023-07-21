provider "aws" {
  region = "sa-east-1"
}

locals {
  name = "utils"

  tags = {
    GithubRepo = "aws-utils"
  }
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  name   = "${local.name}-general-vpc"
  source = "terraform-aws-modules/vpc/aws"

  cidr               = "10.0.0.0/16"
  azs                = ["sa-east-1a", "sa-east-1b"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = false

  tags = local.tags
}
