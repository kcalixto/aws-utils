output "vpc_id" {
  sensitive = false
  value     = module.vpc.vpc_id
}
output "database_subnet_group" {
  sensitive = false
  value     = module.vpc.database_subnet_group
}
output "mysql_sg" {
  sensitive = false
  value     = aws_security_group.mysql-sg.id
}
output "rds" {
  sensitive = false
  value     = module.db
}
