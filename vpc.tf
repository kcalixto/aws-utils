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
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number     = 140
        rule_action     = "allow"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
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
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
  }
}

#############################################################
# Data sources to get VPC and default security group details
#############################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_security_group" "default" {
  name   = "mysql-sg"
  vpc_id = data.aws_vpc.default.id
}

#############################################################
# RESOURCES
#############################################################
module "vpc" {
  name   = "${local.name}-general-vpc"
  source = "terraform-aws-modules/vpc/aws"

  cidr               = "10.0.0.0/16"
  azs                = ["sa-east-1a", "sa-east-1b"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  database_subnets   = ["10.0.3.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = false

  public_dedicated_network_acl = true
  public_inbound_acl_rules     = local.network_acls["public_inbound"]
  public_outbound_acl_rules    = local.network_acls["public_outbound"]

  create_database_subnet_group = true

  tags  = local.tags
  count = local.deploy_vpc ? 1 : 0
}

resource "aws_internet_gateway" "gw" {
  vpc_id     = module.vpc[0].vpc_id
  depends_on = [module.vpc]

  tags  = local.tags
  count = local.deploy_vpc ? 1 : 0
}

module "mysql-sg" {
  source     = "terraform-aws-modules/security-group/aws"
  depends_on = [module.vpc]

  vpc_id = data.aws_vpc.default.id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
    },
  ]

  tags  = local.tags
  count = local.deploy_mysql_sg ? 1 : 0
}
