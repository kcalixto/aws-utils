provider "aws" {
  region = "sa-east-1"
}

locals {
  name = "chatbot"

  tags = {
    GithubRepo = "aws-utils/chatbot"
  }
}
