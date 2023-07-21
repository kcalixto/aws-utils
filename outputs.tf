output "vpc_id" {
  value = module.vpc.vpc_id
}
output "database_subnet_group" {
  value = module.vpc.database_subnet_group
}
output "mysql_sg" {
  value = aws_security_group.mysql-sg.id
}
output "rds" {
  value = module.db
}
