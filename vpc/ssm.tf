resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${local.name}/vpc-id"
  type  = "String"
  value = module.vpc.vpc_id
}
