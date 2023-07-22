resource "aws_ssm_parameter" "mysql-db-user" {
  name  = "/${local.name}/mysql-db-user"
  type  = "String"
  value = var.mysql_db_user
}

resource "aws_ssm_parameter" "mysql-db-pass" {
  name  = "/${local.name}/mysql-db-pass"
  type  = "String"
  value = var.mysql_db_pass
}
