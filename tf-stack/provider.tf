provider "aws" {
  region = "sa-east-1"
}

locals {
  name = "utils"

  tags = {
    GithubRepo = "aws-utils"
  }
}
