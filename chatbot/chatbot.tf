module "chatbot_slack_configuration" {
  source  = "waveaccounting/chatbot-slack-configuration/aws"
  version = "1.1.0"

  configuration_name = "chatbot-slack-configuration"
  iam_role_arn       = aws_iam_role.iam_role.arn
  slack_channel_id   = var.workspace_id
  slack_workspace_id = var.channel_id

  sns_topic_arns = [
    module.sns_topic.topic_arn,
  ]

  tags = local.tags
}
