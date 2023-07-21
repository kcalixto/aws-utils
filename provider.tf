provider "aws" {
  region = "sa-east-1"
}

resource "aws_vpc" "test" {
    cidr_block = "10.0.1.0/24"
}