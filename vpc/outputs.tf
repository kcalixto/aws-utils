output "vpc_id" {
  sensitive = true
  value     = module.vpc.vpc_id
}