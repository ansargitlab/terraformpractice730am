output "vpc_id" {
  description = "The VPC ID from child module"
  value       = module.vpc.vpc_id
}
