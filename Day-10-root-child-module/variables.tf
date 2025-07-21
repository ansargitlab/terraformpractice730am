variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}
variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for the private subnets"
  type        = list(string)
}
variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "rds-sg"
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
  default     = "Allow MySQL traffic"
}

variable "mysql_port" {
  description = "Port used by the RDS instance (default 3306 for MySQL)"
  type        = number
  default     = 3306
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access the RDS instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Replace with a specific CIDR for production
}
variable "db_identifier" {
  description = "Identifier for the RDS DB instance"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance type of the RDS databae"
  type        = string
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "db_allocated_storage" {
  description = "Storage allocated to RDS (in GB)"
  type        = number
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}
variable "ami_id" {
  description = "AMI ID to launch the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

