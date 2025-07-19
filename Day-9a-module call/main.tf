module "prod" {
    source = "../Day-9-modules-example2"
    ami_id = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
}