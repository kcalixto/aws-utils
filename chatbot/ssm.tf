resource "aws_ssm_parameter" "chatbot_sns_arn" {
  name  = "/${local.name}/chatbot-sns-arn"
  type  = "String"
  value = module.sns_topic.topic_arn
}
