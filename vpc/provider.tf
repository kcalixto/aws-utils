provider "aws" {
  region = "sa-east-1"
}

locals {
  name = "utils-vpc"

  tags = {
    GithubRepo = "aws-utils/vpc"
  }
}
