output "vpc_id" {
  sensitive = true
  value     = module.vpc.vpc_id
}
output "database_subnet_group" {
  sensitive = true
  value     = module.vpc.database_subnet_group
}
output "mysql_sg" {
  sensitive = true
  value     = aws_security_group.mysql-sg.id
}
output "rds" {
  sensitive = true
  value     = module.db
}
output "rds-address" {
  sensitive = true
  value     = module.db.db_instance_address
}