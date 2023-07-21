# module "vpc" {
#   name   = "${local.name}-general-vpc"
#   source = "terraform-aws-modules/vpc/aws"

#   cidr               = "10.0.0.0/16"
#   azs                = ["sa-east-1a", "sa-east-1b"]
#   public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
#   private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
#   enable_nat_gateway = false

#   tags = local.tags
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = module.vpc.vpc_id
#   tags   = local.tags
# }
