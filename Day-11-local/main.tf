locals {
  region        = "us-east-1"
  instance_type = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = local.instance_type
  tags = {
    Name = "App-${local.region}"
  }
}