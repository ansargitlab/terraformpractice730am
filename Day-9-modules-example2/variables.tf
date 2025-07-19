variable "ami_id" {
    description = "The AMI ID to use for the instance"
    type        = string
    default     = ""
  }
variable "instance_type" {
    description = "The type of instance to create"
    type        = string
    default     = ""
}
variable "availability_zone" {
    type = string
    default = ""
}
