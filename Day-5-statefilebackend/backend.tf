terraform {
#required_version = ">=1.10" # this will allow to work same terraform version only 
  backend "s3" {
    bucket = "ansar1062025"
    key    = "terraform.tfstate"
    region = "us-east-2"
    use_lockfile = true #supports latest version >=1.10
    #dynamodb_table = "veera"
    #encrypt = true
  }
}