variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "Two private subnet CIDRs"
  type        = list(string)
}

variable "availability_zones" {
  description = "Two availability zones"
  type        = list(string)
}
