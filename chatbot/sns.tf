module "sns_topic" {
  source = "terraform-aws-modules/sns/aws"
  name   = "${local.name}-sns"
  tags   = local.tags
}
