module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "demo"

  engine               = "mysql"
  engine_version       = "8.0"
  family               = "mysql8.0"
  major_engine_version = "8.0"
  instance_class       = "db.t2.micro"

  allocated_storage     = 20
  max_allocated_storage = 20

  db_name  = "mysql-db"
  username = "admin"
  port     = 3306

  multi_az               = true
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = [aws_security_group.mysql-sg.id]

  deletion_protection = false
  storage_encrypted = false

  tags  = local.tags
}
