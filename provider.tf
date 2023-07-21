provider "aws" {
  region = "sa-east-1"
}

locals {
  name = "utils"

  tags = {
    GithubRepo = "github.com/kcalixto/aws-utils"
  }
}
