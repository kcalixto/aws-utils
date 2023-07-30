locals {
  network_acls = {
    public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
  }
}

module "vpc" {
  name   = "${local.name}-general-vpc"
  source = "terraform-aws-modules/vpc/aws"

  cidr               = "10.1.0.0/16"
  azs                = ["sa-east-1a", "sa-east-1b"]
  public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets    = ["10.1.101.0/24", "10.1.102.0/24"]
  enable_nat_gateway = false

  public_dedicated_network_acl = true
  public_inbound_acl_rules     = local.network_acls["public_inbound"]
  public_outbound_acl_rules    = local.network_acls["public_outbound"]

  tags = local.tags
}
