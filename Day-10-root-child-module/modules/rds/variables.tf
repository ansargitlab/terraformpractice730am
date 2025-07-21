variable "db_identifier" {
  description = "mydb"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "admin"
  type        = string
}

variable "db_password" {
  description = "admin123"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 10
}

variable "db_engine" {
  description = "RDS engine type (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Engine version"
  type        = string
  default     = "8.0"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group"
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
  default     = false
}
