provider "aws" {
  region = "sa-east-1"
}

locals {
  name = "utils-rds"

  tags = {
    GithubRepo = "aws-utils/templates/rds"
  }
}
