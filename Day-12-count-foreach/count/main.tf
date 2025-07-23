############### Example-1 -name with count ###########
resource "aws_instance" "name" {
    instance_type = "t2.micro"
    count = 3
    tags = {
        Name = "dev"
      }
}

############## Example 2 - different names ################
variable "env" {
    type = list(string)
    default = ["dev", "test", "prod"]
  }
  resource "aws_instance" "name1" {
     ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    count = length(var.env)

    tags = {
        Name = var.env[count.index]
        }
}