variable "ami_id" {
  description = "AMI ID for the AWS instance"
  type        = string
    default     = ""
  
}
variable "instance_type" {
  description = "Instance type for the AWS instance"
  type        = string
  default     = "t2.micro"

  
}