provider "aws" {
  region = "${var.region}"
}

locals {
  name = "utils"

  tags = {
    GithubRepo = "github.com/kcalixto/aws-utils"
  }
}
