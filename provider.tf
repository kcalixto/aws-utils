provider "aws" {
  region = "sa-east-1"
}

locals {
  name = "utils"

  # VPC
  deploy_vpc = false
  # MYSQL RDS
  deploy_mysql_sg = false
  deploy_rds      = false

  tags = {
    GithubRepo = "aws-utils"
  }
}
