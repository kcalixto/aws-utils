module "mysql-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "mysql-sg"
  vpc_id = module.vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
  ]

  tags   = local.tags
  count = local.deploy_mysql_sg ? 1 : 0
}
